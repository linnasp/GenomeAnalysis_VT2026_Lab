#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 24:00:00
#SBATCH --mem=64G
#SBATCH -J 1_ch3_braker
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/errorfiles/%x.%j.err

# Ladda moduler
module load SAMtools/1.21.1-GCC-13.3.0

# Sökvägar (Dina mappar)
GENOME_pilon_softmask=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/01_run/pilon.fasta.masked
hisat_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/results
OUTDIR=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/results_ch3
BRAKER_SIF=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif
MY_CONFIG=/home/linnasp/bin/augustus_config

# Skapa output + tmp
mkdir -p $OUTDIR
export TMPDIR=$OUTDIR/tmp
mkdir -p $TMPDIR

cd $OUTDIR

echo "Checking genome..."
ls -lh $GENOME_pilon_softmask

echo "Checking BAM files in $hisat_dir..."
# Samla BAM-filer till en kommaseparerad lista
BAM_FILES=$(ls $hisat_dir/*_sorted.bam | tr '\n' ',' | sed 's/,$//')

if [ -z "$BAM_FILES" ]; then
    echo "FEL: Inga BAM-filer hittades i $hisat_dir!"
    exit 1
fi

echo "BAM list: $BAM_FILES"

# Run BRAKER (ET-mode: ONLY RNA, no proteins)
# Vi mappar din config-mapp till containerns interna sökväg
singularity exec \
    -B $MY_CONFIG:/opt/Augustus/config \
    -B /home/linnasp:/home/linnasp \
    -B /crex/proj/uppmax2026-1-61:/crex/proj/uppmax2026-1-61 \
    $BRAKER_SIF braker.pl \
        --genome=$GENOME_pilon_softmask \
        --bam=$BAM_FILES \
        --species=linnasp_N_jap_1_chr3 \
        --softmasking \
        --threads=2 \
        --workingdir=$OUTDIR

echo "BRAKER ET-mode finished!"