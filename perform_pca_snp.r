# perform real pca with snprelate

# Open the GDS file
library(gdsfmt)
library(SNPRelate)
library(SeqArray)

# Open the GDS file
genofile <- snpgdsOpen("test.gds")

######### Start Performing PCA
set.seed(1000)

# Try different LD thresholds for sensitivity analysis
snpset <- snpgdsLDpruning(genofile, ld.threshold=0.2)
str(snpset)
names(snpset)
# Get all selected snp id
snpset.id <- unlist(unname(snpset))
head(snpset.id)
# Run PCA
pca <- snpgdsPCA(genofile, snp.id=snpset.id, num.thread=2)
# variance proportion (%)
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))

# Make a data.frame
tab <- data.frame(sample.id = pca$sample.id,
    EV1 = pca$eigenvect[,1],    # the first eigenvector
    EV2 = pca$eigenvect[,2],    # the second eigenvector
    stringsAsFactors = FALSE)

# Add population information
read.pop <- read.csv("pop.csv", header = FALSE)
tab$pop <- factor(read.pop$V2[match(tab$sample.id, read.pop$V1)])

head(tab)

# Draw
plot(tab$EV2, tab$EV1, col=as.integer(tab$pop), xlab="eigenvector 2", ylab="eigenvector 1")
legend("bottomright", legend=levels(tab$pop), pch="o", col=1:nlevels(tab$pop))
# Plot the principal component pairs for the first four PCs:
lbls <- paste("PC", 1:4, "\n", format(pc.percent[1:4], digits=2), "%", sep="")
pairs(pca$eigenvect[,1:4], col=tab$pop, labels=lbls)

# close file
snpgdsClose(genofile)

# end of script
