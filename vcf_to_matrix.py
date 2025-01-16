from pysam import VariantFile

import numpy as np

from sklearn import decomposition

import pandas as pd

vcf_file_name = "ALL.chr22.phase1_release_v3.20101123.snps_indels_svs.genotypes.vcf"

panel_file_name = "phase1_integrated_calls.20101123.ALL.panel"

counter = 0
genotypes = []
samples = []
variant_ids = []
with VariantFile(vcf_file_name) as vcf_reader:
    for record in vcf_reader:
        #print(record)
        #print(record.samples)
        if counter % 100 == 0:
            alleles = [record.samples[x].allele_indices for x in record.samples]
            samples = [sample for sample in record.samples]
            genotypes.append(alleles)
            variant_ids.append(record.id)
        
        # this is to keep track of the execution progress
        counter += 1
        if counter % 4943 == 0:
            print(f'{round(100 * (counter / 494328))}%')


with open(panel_file_name, "r") as panel_file:
    labels = {} # {sample_id: population}
    for line in panel_file:
        line = line.strip().split('\t')
        labels[line[0]] = line[1]

print(labels)

genotypes = np.array(genotypes)
print(genotypes.shape)

matrix = np.count_nonzero(genotypes, axis=2)
matrix = matrix.T
print(matrix.shape)

pca = decomposition.PCA(n_components=2)
pca.fit(matrix)
print(pca.singular_values_)
to_plot = pca.transform(matrix)
print(to_plot.shape)

df = pd.DataFrame(matrix, columns=variant_ids, index=samples)

df["Population code"] = df.index.map(labels)

df.to_csv("matrix.csv")
