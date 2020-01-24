#!/bin/bash
#SBATCH --job-name=mash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=168:00:00
#SBATCH --mem=50gb

export OMP_NUM_THREADS=8

module load mash/2.2

# we use kmer length 30 for KMC
mash sketch -p 8 -k 30 core_gene_alignment.aln
mash dist -p 8 core_gene_alignment.aln.msh core_gene_alignment.aln.msh
