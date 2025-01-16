import pandas as pd
from sklearn import decomposition
import altair as alt

df = pd.read_csv("matrix.csv")
# print(df.head())
df.rename(columns= {'Unnamed: 0': 'Sample'}, inplace=True)
# print(df.head())
non_snps_columns = ['Sample', 'Population code']
df_snps = df.drop(columns=non_snps_columns, axis=1)
# print(df_snps.head())
matrix = df_snps.to_numpy()
# print(matrix.shape)
pca = decomposition.PCA(n_components=2)
pca.fit(matrix)
print(pca.singular_values_)
print(pca.explained_variance_ratio_)

to_plot = pca.transform(matrix)
df_plot = df[non_snps_columns].copy()
df_plot['PC1'] = to_plot[:, 0]
df_plot['PC2'] = to_plot[:, 1]

pop = pd.read_csv('igsr_populations.tsv', sep='\t')
df_plot = df_plot.merge(pop, on='Population code', how='inner')

alt.Chart(df_plot).mark_point().encode(
    x='PC1',
    y='PC2',
    color=alt.Color('Superpopulation name'),
    fill=alt.Color('Superpopulation name')
)
