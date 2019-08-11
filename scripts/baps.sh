#!/bin/bash

#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="baps"
#SBATCH --error="baps.%J.error"
#SBATCH --output="baps.%J.out"

#module load

module load anaconda/4.6
conda create -n r-rhierbaps r-rhierbaps
conda activate r-rhierbaps

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/prokka_human_bovine/prokka_output/roary/baps 

cd $DATAIN

Rscript baps.R


# the baps.R is a separate script although I am putting them together here

# Load library

library("rhierbaps")

# Set seed to reproduce results

set.seed(1234)

# Load data

input_file <- system.file("extdata", "core_gene_alignment.fa", package = "rhierbaps")
snp_matrix <- load_fasta(input_file)
hb_results <- hierBAPS(snp_matrix, max.depth = 2, n.pops = 50, n.extra.rounds = Inf, 
    quiet = TRUE)
write.csv(hb_results$partition.df, file = file.path(/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/prokka_human_bovine/prokka_output/roary/baps, "hierbaps_partition.csv"), 
    col.names = TRUE, row.names = FALSE)
