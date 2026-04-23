#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J FastQC_RNA
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/01_FastQC_RNA/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/01_FastQC_RNA/errorfiles/%x.%j.err

# Load modules

module load FastQC/0.12.1-Java-17

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/01_FastQC_RNA/results

# Your commands

fastqc -t 2 \
-o $out_dir \
 /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/*.fq.gz