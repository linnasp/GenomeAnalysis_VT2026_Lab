#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J star
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_STAR/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_STAR/errorfiles/%x.%j.err

module load STAR/2.7.11b-GCC-13.3.0
module load gcc/6.2.0 star/2.5.2b

# Input 
PILON_assembly=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/pilon.fasta

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_STAR/01_run

STAR --runThreadN 2 \
--runMode genomeGenerate \
--genomeDir  \
--genomeFastaFiles /rna.fa \
--sjdbGTFfile \
--sjdbOverhang 
