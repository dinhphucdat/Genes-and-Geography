# perform pca with SNPRelate tool
# Load the R packages: gdsfmt and SNPRelate
library(gdsfmt)
library(SNPRelate)

# snpgdsSummary(snpgdsExampleFileName()) # check the default file --it worked!

# Convert VCF to GDS
vcf.fn <- "ALL.chr22.phase1_release_v3.20101123.snps_indels_svs.genotypes.vcf"

# Reformat
snpgdsVCF2GDS(vcf.fn, "test.gds", method="biallelic.only")


