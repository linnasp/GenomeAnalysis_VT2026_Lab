#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 12:00:00
#SBATCH -J trim_RNA
#SBATCH --mem=16G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/errorfiles/%x.%j.err

# Load modules
module load Trimmomatic/0.39-Java-17

input_dir=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/
output_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/Trimmed_seq
for R1 in ${input_dir}/*_f1.fq.gz; do
    R2=${R1/_f1.fq.gz/_r2.fq.gz}
    sample_name=$(basename $R1 _f1.fq.gz)
    trimmomatic PE -threads 2 \
    $R1 \
    $R2 \
    $output_dir/${sample_name}_f_paired.fq.gz \
    $output_dir/${sample_name}_f_unpaired.fq.gz \
    $output_dir/${sample_name}_r_paired.fq.gz \
    $output_dir/${sample_name}_r_unpaired.fq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done

