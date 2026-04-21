#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J repeatmasking
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/errorfiles/%x.%j.err

module load RepeatMasker/4.2.1-foss-2024a

Pilon_asembly=linkTBA
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/01_RepeatMasker

RepeatMasker \
-dir $out_dir \
-xsmall \
-species "viridiplantae" \
-pa 2 \
$Pilon_asembly

