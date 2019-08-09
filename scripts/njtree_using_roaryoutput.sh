#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="njtreeroary"
#SBATCH --error="njtreeroary.%J.error"
#SBATCH --output="njtreeroary.%J.out"

#module load

module load anaconda/4.6
module load biopython/py36/1.71

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/prokka_human_bovine/prokka_output/roary/gubbins/njroary

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

# Construct the phylogenetic tree using NJ algorithm
constructor = DistanceTreeConstructor()
tree = constructor.nj(dm)

# Draw the phylogenetic tree
Phylo.draw(tree)

testplot1roary = Phylo.draw_ascii(tree)
plt.savefig('testplot1roary.png')
Image.open('testplot1roary.png').save('testplot1roary.jpg','JPEG')

testplot2roary = tree.ascii_art()
plt.savefig('testplot2roary.png')
Image.open('testplot2roary.png').save('testplot2roary.jpg','JPEG')

