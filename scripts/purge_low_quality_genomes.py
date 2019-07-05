#!/bin/python

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="filtering_low_quality_genomes"
#SBATCH --error="filtering_low_quality_genomes.%J.error"
#SBATCH --output="filtering_low_quality_genomes.%J.out"

# Module load

module load python/3.7
import pandas as pd

# In the cluster just load anaconda

module load anaconda/4.6

# Access the file and open the transposed_report.tsv

filename = 'path_to/transposed_report.tsv'
data = pd.read_csv(filename, sep='\t', header=0, na_values='Nothing')

# Identify the genomes to purge based on the following criteria: number of contigs == 0 or >= 300 or N50 <= 25,000

genomes_to_drop = data.loc[(data['# contigs'] == 0) | (data['# contigs'] >= 300) | (data['N50'] <= 25000)]
id_genomes_to_drop = genomes_to_drop[['Assembly']] #save genomes to purge separately

# Write genomes to purge out as a txt file 
id_genomes_to_drop.to_csv(r'path_to/id_genomes_to_drop.txt', header=None, index=True, sep=' ', mode='a')
