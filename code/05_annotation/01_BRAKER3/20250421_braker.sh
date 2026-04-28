#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J test_braker
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/errorfiles/%x.%j.err

module load BRAKER/3.0.8-foss-2024a

export AUGUSTUS_CONFIG_PATH=/home/linnasp/bin/augustus_config

# Input 
softmask=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/01_run/pilon.fasta.masked
hisat_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/results
RNA_Seq=$hisat_dir/Control_1_sorted.bam,$hisat_dir/Control_2_sorted.bam,$hisat_dir/Control_3_sorted.bam,$hisat_dir/Heat_1_sorted.bam,$hisat_dir/Heat_2_sorted.bam,$hisat_dir/Heat_3_sorted.bam
BRAKER_SIF=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/results
temporary_out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/temporary_files

export TMPDIR=$temporary_out_dir

singularity exec \
    -B /home/linnasp:/home/linnasp \
    -B /crex/proj/uppmax2026-1-61:/crex/proj/uppmax2026-1-61 \
    -B $AUGUSTUS_CONFIG_PATH:/opt/Augustus/config \
    $BRAKER_SIF braker.pl \
        --threads=2 \
        --genome=$softmask \
        --bam $RNA_Seq \
        --workingdir=$out_dir \
        --species=linnasp_Njap \
        --softmasking \
        --prot_seq=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/protein_evidence/Viridiplantae_filtered.fa