# Analysis of this project
> [!NOTE]
> My series of projects that I have been and will be pushing onto GitHub serves as a chronological account of what I'm doing and what I will have learned from them, so the text may not be as scientific as any reader will expect
## Background
This is my first bioinformatics project I ever did. I discovered that I had a strong interest in this field just as my semester of taking the object-oriented computer science course was about to end, which led me to seek out some opportunity to improve my skillset by starting some personal projects related to this field. And, one of them is Principle Component Analysis of Single-Nucleotide Polymorphism.
## Method
I did this project using two different methods, including constructing a genotypic matrix and performing PCA from scratch ([link to video is here](https://youtu.be/-PCKK_nwFdA?si=YlwqSnjwVJuYQBS9)), and using another software, [SNPRelate](https://www.bioconductor.org/packages/release/bioc/html/SNPRelate.html) for the sake of efficiency. I followed the video first to have a rough understanding of the philosophy of PCA and how it (and softwares performing it) internally worked, and then reproduced the result with [SNPRelate](https://www.bioconductor.org/packages/release/bioc/html/SNPRelate.html) to observe the probable improvement in efficiency. Instruction on how to run this project can be found here, in the light of which this [file]() should be downloaded and unzipped. The sample was collected from people around the world but they are now only categorized into four major population groups, namely east asian, african, american, and european for the sake of simplicity. PCA was used to evaluate genes on the chromosome 22.
## Result
Please check out [here](visualization.png) for the result of the method described in the video and [here](Rplots.pdf) for the result of using the SNPRelate software.
## Discussion
As observed with only bare eyes, there is only a little difference in the result after reproducing with SNPRelate.

Samples that are represented as clustered together are assumed to be more similar to each other, which can be proved by the fact that samples with the same population code clustered together. It appears interesting that the Americans are spreaded between the Europeans and the Africans, suggesting some degree of genetic overlapping. The Asians are in their own cluster.
