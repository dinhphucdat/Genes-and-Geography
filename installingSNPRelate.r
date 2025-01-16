
# only need to run this script once to install the SNPRelate package

options(repos = c(CRAN = "https://cloud.r-project.org"))

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("SNPRelate")
BiocManager::install("gdsfmt")
BiocManager::install("SeqArray")
# end of script
