#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J trim_RNA
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/errorfiles/%x.%j.err

# Load modules
module load Trimmomatic/0.39-Java-17

input_dir=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/
output_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/testrun
nr=0

for R1 in ${input_dir}/*_f1.fq.gz; do
    R2=${R1/_f1.fq.gz/_r2.fq.gz}
    ((nr++))
    trimmomatic PE -threads 2 \
    $R1 \
    $R2 \
    $output_dir/output_forward_paired_$nr.fq.gz \
    $output_dir/output_forward_unpaired_$nr.fq.gz \
    $output_dir/output_reverse_paired_$nr.fq.gz \
    $output_dir/output_reverse_unpaired_$nr.fq.gz \
    ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done

