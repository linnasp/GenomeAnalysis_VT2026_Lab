#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 24:00:00
#SBATCH -J pilon
#SBATCH --mem=64GB #memory allocated to job
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/errorfiles/%x.%j.err

module load Pilon/1.24-Java-17

# Input files
FLYE_genome_assembly=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/01_Flye/assembly.fasta
BWA_samtools_mapping=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/02_BWA_03_SAMtools/mapped_reads_sorted.bam

out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon

java -Xmx16G -jar $EBROOTPILON/pilon.jar \
--genome $FLYE_genome_assembly \
--frags $BWA_samtools_mapping \
--outdir $out_dir \
--output pilon \
--threads 2