#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J FastQC_rawreads
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/01_FastQC/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/01_FastQC/errorfiles//%x.%j.err

# Load modules

module load FastQC/0.12.1-Java-17

# Your commands

fastqc -t 1 \
-o /home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/01_FastQC/ \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz \
