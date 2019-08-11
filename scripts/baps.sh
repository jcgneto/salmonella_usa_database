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
module load raxml/8.2
module load fasttree/2.1
module load biopython/py36/1.71
module load gubbins/2.3

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/prokka_human_bovine/prokka_output/roary/gubbins

cd $DATAIN

run_gubbins.py -t fasttree -i 100 -m 3 -v core_gene_alignment.aln
