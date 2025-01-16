# Genes and Geography
## Acknowledgement
This idea was introduced by a [video](https://youtu.be/-PCKK_nwFdA?si=YlwqSnjwVJuYQBS9) by OMGenomics. I truly thank the creator of this channel for inspiring me to embark my bioinformatics journey.

Also, I wanted to thank my instructor, Kenichi Okamoto, for introducing SNPRelate and the idea of SNP, whose GitHub can be found [here](https://github.com/kewok).

Finally, I am grateful for the people who engineered [SNPRelate](https://www.bioconductor.org/packages/release/bioc/html/SNPRelate.html) so that I could use to reproduce the result. I am grateful for the [public data](https://www.internationalgenome.org/category/vcf/) where I got my VCF file.
## Description
A detailed description of this project can be found [here](DESCRIPTION.md).
## Execution
### System requirements
This repository assumes that users have gotten R (above 4.4), Python (above 3.6), and Snakemake installed.
### Configuration file preparation
For the memory threshold regulation from GitHub, the upstream VCF file could not be pushed onto this repository, unfortunately, but such a file can be found [here](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20110521) then download the vcf.gz for chromosome 22, which is in a zipped format and needs to be unzipped using the gunzip command line. Place the unzipped vcf file into this same directory.
### Steps to execute
1. Clone the repository:
    ```$ git clone https://github.com/dinhphucdat/Genes-and-Geography.git```
2. Run the repo:
    ```$ snakemake```
