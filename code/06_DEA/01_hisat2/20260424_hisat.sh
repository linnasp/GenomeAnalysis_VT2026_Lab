#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 16:00:00
#SBATCH -J hisat
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/errorfiles/%x.%j.err

module load HISAT2/2.2.1-gompi-2024a

convert SAM to BAM files

# Input 
PILON_assembly=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/pilon.fasta
outputfromTrimmomatic_RNAseq=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/Trimmed_seq

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_STAR/01_run

