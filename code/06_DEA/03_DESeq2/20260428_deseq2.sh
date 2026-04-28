#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J test_deseq2
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/03_DESeq2/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/03_DESeq2/errorfiles/%x.%j.err

module load R/4.4.2-gfbf-2024a
module load R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2
module load DESeq2/1.46.0

Rscript 