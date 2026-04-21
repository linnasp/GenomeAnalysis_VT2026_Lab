#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 06:00:00
#SBATCH -J repeatmodeler
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/01_RepeatModeler/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/01_RepeatModeler/errorfiles/%x.%j.err

module load RepeatModeler/2.0.7-foss-2024a
module load BLAST+/2.16.0-GCC-13.3.0 
module load HMMER/3.4-GCC-13.3.0
module load AUGUSTUS/3.5.0

# Input 
PILON_assembly=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/pilon.fasta

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/01_RepeatModeler/3_run
cd $out_dir

# Create database
BuildDatabase -name N_japonicum_db $PILON_assembly

RepeatModeler \
-database N_japonicum_db \
-threads 2 \
-LTRStruct