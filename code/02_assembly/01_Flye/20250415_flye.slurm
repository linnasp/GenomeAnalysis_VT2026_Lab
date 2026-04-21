#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 24:00:00
#SBATCH -J flye_assembly
#SBATCH --mem=90GB
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/01_Flye/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/01_Flye/errorfiles/%x.%j.err

module load Flye/2.9.6-GCC-13.3.0

flye \
--nano-raw /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_clean_nanopore.fq.gz \
--out-dir /home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/01_Flye/ \
--threads 2 \
--genome-size 16m 
