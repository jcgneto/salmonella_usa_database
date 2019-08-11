#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="snpsites"
#SBATCH --error="snpsites.%J.error"
#SBATCH --output="snpsites.%J.out"

#module load

module load snp-sites/2.4

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/prokka_human_bovine/prokka_output/roary/gubbins/snp_sites

cd $DATAIN

# Run snp-sites

snp-sites core_gene_alignment.aln
