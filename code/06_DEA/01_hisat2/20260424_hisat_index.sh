#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J test_hisat_index
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/errorfiles/%x.%j.err

module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

# Input 
PILON_assembly=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/pilon.fasta
MASKED_pilon=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/01_run/pilon.fasta.masked

# Index
index_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/hisat_index

mkdir -p $index_dir

hisat2-build \
-p 2 \
$MASKED_pilon \
$index_dir/hisat2_index
