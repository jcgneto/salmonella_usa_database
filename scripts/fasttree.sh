#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="fasttree"
#SBATCH --error="fasttree.%J.error"
#SBATCH --output="fasttree.%J.out"

#module load

module load fasttree/2.1

DATAIN=
DATAOUT=

cd $DATAIN

FastTree -nt -pseudo -fastest < core_gene_alignment.aln > core_gene_alignment.tree
