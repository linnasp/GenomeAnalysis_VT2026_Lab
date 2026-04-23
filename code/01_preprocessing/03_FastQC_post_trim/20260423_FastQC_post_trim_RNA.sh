#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J FastQC_trimmed_RNA
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/03_FastQC_post_trim_RNA/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/03_FastQC_post_trim_RNA/errorfiles/%x.%j.err

module load FastQC/0.12.1-Java-17

in_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/Trimmed_seq
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/03_FastQC_post_trim_RNA/testrun

fastqc -t 2 \
-o $out_dir \
${in_dir}/*paired.fq.gz
