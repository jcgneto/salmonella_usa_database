#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="distroary"
#SBATCH --error="distroary.%J.error"
#SBATCH --output="distroary.%J.out"

#module load

module load anaconda/4.6
module load biopython/py36/1.71

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/prokka_human_bovine/prokka_output/roary/gubbins

cd $DATAIN

# Import modules - already coming from module load
#from Bio import Phylo
#from Bio.Phylo.TreeConstruction import DistanceCalculator
#from Bio.Phylo.TreeConstruction import DistanceTreeConstructor
#from Bio import AlignIO

# Read the sequences and align
aln = $DATAIN/core_gene_alignment.aln

# Calculate the distance matrix
calculator = DistanceCalculator('identity')
dm = calculator.get_distance(aln)
np.savetxt('distmatrixroary.txt',dm,fmt='%.2f')


