#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J multiqc_trimmed_RNA
#SBATCH --mem=8G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/03_FastQC_post_trim_RNA/MultiQC/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/03_FastQC_post_trim_RNA/MultiQC/errorfiles/%x.%j.err

module load MultiQC/1.28-foss-2024a

# Input 
input_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/03_FastQC_post_trim_RNA/results_post_trim

# Output
out_dir=results/01_preprocessing/04_RNA/03_FastQC_post_trim_RNA/MultiQC

multiqc $input_dir -o $out_dir
