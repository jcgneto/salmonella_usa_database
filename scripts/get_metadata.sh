#!/bin/bash
#SBATCH --job-name=metadata
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=12:00:00
#SBATCH --mem=13gb

module load entrez-direct/11.0

# ids.txt is a list of SRA IDs
for i in $(cat ids.txt)
do 
sra_id=${i}
host_disease=`esearch -db sra -query ${sra_id} | elink -target biosample | efetch -format docsum | xtract -pattern DocumentSummary -block Attribute -if Attribute@attribute_name -equals "host disease" -element Attribute`
isolation_source=`esearch -db sra -query ${sra_id} | elink -target biosample | efetch -format docsum | xtract -pattern DocumentSummary -block Attribute -if Attribute@attribute_name -equals "isolation_source" -element Attribute`
host=`esearch -db sra -query ${sra_id} | elink -target biosample | efetch -format docsum | xtract -pattern DocumentSummary -block Attribute -if Attribute@attribute_name -equals "host" -element Attribute`
sleep 1
geo_loc=`esearch -db sra -query ${sra_id} | elink -target biosample | efetch -format docsum | xtract -pattern DocumentSummary -block Attribute -if Attribute@attribute_name -equals "geo_loc_name" -element Attribute`
title=`esearch -db sra -query ${sra_id} | elink -target biosample | efetch -format docsum | xtract -pattern DocumentSummary -if Title -first Title`
echo -e "$sra_id|$title|$geo_loc|$host|$host_disease|$isolation_source" >> metadata_output.txt
done
