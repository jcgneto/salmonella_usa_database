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

* Population genomics analysis of all serovars of S. Enterica isolated from United States (entire NCBI database)
-- isolates will be filtered from SRA database)

* Genome-wide association study to identify genomic events separating major BAPS clusters vs others 

### Computational approach

1. Download all paired-ended Illumina reads to the HCC cluster 
2. Quality check and trim reads (the scalability of this step will be tested as we move along)
3. Assembly with Spades
4. Assemblies QC with quast and filter out low quality genomes using customed python scripts
5. Annotation with Prokka
6. Pangenome analysis with Roary
7. Phylogenetics with fasttree and raxml
8. ST calls using mlst
9. plasmifinder to find plasmid
10. abricate to find resistance, virulence, and plasmid related genes
11. BAPS analysis of pop structure
12. snp-sites to filter snps
13. gubbins to find regions of recombination
14. k-mer based GWAS using pyseer 
15. Using pegasus to integrate the pipeline


#### GWAS approach

* The k-mer based approach was chosen, but a gene presence/absence will also be used. 
* We are interested in two types of genomic events: ancestral to the group of interest (present in all isolates) or those that have recently emerged in the group of interest vs a closely related isolate of another group that is divergent on the phenotype but convergent on phylogenetic position (controlling for ancestral relationships). 



