#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 12:00:00
#SBATCH -J 1_hisat_mapping
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/errorfiles/%x.%j.err

module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

# Input 
trim_RNAseq=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/Trimmed_seq

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/01_run
index_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/hisat_index

mkdir -p $out_dir

trim_seq="Control_1 Control_2 Control_3 Heat_1 Heat_2 Heat_3"

for i in $trim_seq
do
    hisat2 \
    -p 2 \
    -x $index_dir/hisat2_index \
    -1 ${trim_RNAseq}/${i}_f_paired.fq.gz \
    -2 ${trim_RNAseq}/${i}_r_paired.fq.gz \
    | samtools sort -@ 2 -o ${out_dir}/${i}_sorted.bam 
    
    samtools index ${out_dir}/${i}_sorted.bam
done
