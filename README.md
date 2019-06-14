# Project title: Identification of novel genomic signatures of environmental adaptation in Salmonella enterica 

* Analysis of Salmonella genomes using publicly available genomes (SRA-NCBI) from the United States.

# Group members:

Joao Carlos Gomes Neto - UNL (Postdoc - Project manager and data analyst);
Natasha Pavlovikj - UNL (Computer Scientist);
Byron Chaves - UNL (Food Safety expert);
Dustin Loy - UNL (Veterinarian & Diagnostician);
Peter Iwen - UNMC (MD, Epidemiologist);
Baha Abdalhamid - UNMC (MD, Clinical Microbiologist);
Andrew Benson - UNL (leader PI)

## Objectives  

* Population genomics analysis of S.Typhimurium isolated from United States (entire NCBI database)
-- isolates of S. Typhimurium will be filtered from this database (https://www.ncbi.nlm.nih.gov/pathogens/isolates/#/search/taxgroup_name:%22Salmonella%20enterica%22)

* Genome-wide association study to identify genomic events separating major ribotypes vs others 

### Computational approach

1. Download all paired-ended Illumina reads to the HCC cluster 
2. Quality check and trim reads (the scalability of this step will be tested as we move along)
3. Assembly with Spades
4. Assemblies QC with quast
5. Annotation with Prokka
6. Pangenome analysis with Roary
7. Phylogenetics with ggtree
8. ST and ribotype calls with customed scripts 
9. k-mer based GWAS using pyseer, R (libraries to be cited), scoary, and neptune
10. k-mer mapping to reference genome (may consider mapping to a pangenome)

#### GWAS approach

* The k-mer based approach was chosen, but a gene presence/absence will also be used. 
* We are interested in two types of genomic events: ancestral to the group of interest (present in all isolates) or those that have recently emerged in the group of interest vs a closely related isolate of another group that is divergent on the phenotype but convergent on phylogenetic position (controlling for ancestral relationships). 



