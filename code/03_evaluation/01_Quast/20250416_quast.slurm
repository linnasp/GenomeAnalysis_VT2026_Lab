#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:20:00
#SBATCH -J quast
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/01_Quast/outputfiles%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/01_Quast/errorfiles/%x.%j.err

module load QUAST/5.3.0

# Input 
FLYE_genome_assembly=linkTBA
PILON_genome_polished=linkTBA

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/01_Quast

quast.py \
$FLYE_genome_assembly $PILON_genome_polished -o $out_dir