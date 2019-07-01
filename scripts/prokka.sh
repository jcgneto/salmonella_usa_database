#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="prokka"
#SBATCH --error="prokka.%J.error"
#SBATCH --output="prokka.%J.out"

#module load

module load python/3.7
module load prokka/1.13

#enter directory

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/bovine_salmonella_VDL/assemblies/prokka_contigs/correct_files
DATAOUT=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/bovine_salmonella_VDL/assemblies/prokka_contigs/correct_files/prokka_done

cd $DATAIN

for F in *.fa; do 
  N=$(basename $F .fa) ; 
  prokka --kingdom Bacteria --locustag $N --outdir $DATAOUT/$N --prefix $N  $F ; 
done

