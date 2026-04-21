#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J braker
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/errorfiles/%x.%j.err

module load BRAKER/3.0.8-foss-2024a

# Input 
softmask= output of RepeatMasker
RNA_Seq=BAM fil from STAR

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3

braker.pl \
--threads=2 \
--genome $softmask \
--bam $RNA_Seq \
--busco_lineage embryophyta_odb10 \
--workingdir=$out_dir

