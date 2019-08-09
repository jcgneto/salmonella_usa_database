#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="fasttreeslow"
#SBATCH --error="fasttreeslow.%J.error"
#SBATCH --output="fasttreeslow.%J.out"

#module load

module load fasttree/2.1

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/prokka_human_bovine/prokka_output/roary/fasttreeslow

cd $DATAIN

FastTree -nt -gtr < core_gene_alignment.aln > sentericaslowphylogeny.tree

