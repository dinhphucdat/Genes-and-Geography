# string all processes together
rule all:
    input:
        "Rplots.pdf"

# get the pop information ready
rule pop_prep:
    input:
        "phase1_integrated_calls.20101123.ALL.panel"
    output:
        "pop.csv"
    shell:
        """
        python -u 'reprocess_popcode.py'
        """

# install the snprelate package
rule install_snprelate:
    shell:
        """
        Rscript -e 'installingSNPRelate.r'
        """

# create the gds file
rule create_gds:
    input:
        "ALL.chr22.phase1_release_v3.20101123.snps_indels_svs.genotypes.vcf"
    output:
        "test.gds"
    shell:
        """
        Rscript -e 'source("reformat_gds.r")'
        """

# perform the pca
rule perform_pca:
    input:
        test_gds = "test.gds",
        pop_csv = "pop.csv"
    output:
        "Rplots.pdf"
    shell:
        """
        Rscript -e 'source("perform_pca_snp.r")'
        """
