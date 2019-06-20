#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=100GB
#SBATCH --job-name="stroary_carlos"
#SBATCH --error="stroary.%J.error"
#SBATCH --output="stroary.%J.out"

#module load

module load python/3.7
module load roary/3.12

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/bovine_salmonella_VDL/assemblies/prokka_contigs/correct_files/prokka_done/roary_files
DATAOUT=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/bovine_salmonella_VDL/assemblies/prokka_contigs/correct_files/prokka_done/roary_files/roary_output

cd $DATAIN

roary -e --mafft -p 8 *.gff -f $DATAOUT

