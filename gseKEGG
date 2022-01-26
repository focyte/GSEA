library(clusterProfiler)
library(enrichplot)
library(ggplot2)


# reading in data from deseq2
df = read.csv("x.csv", header=TRUE)

# we want the log2 fold change 
original_gene_list <- df$log2FoldChange

# name the vector
names(original_gene_list) <- df$X

# omit any NA values 
gene_list<-na.omit(original_gene_list)

# sort the list in decreasing order (required for clusterProfiler)
gene_list = sort(gene_list, decreasing = TRUE)

# Check names are correctly loaded
names(original_gene_list)

# Run KEGG analysis using 0.05 p value cut off first, then reduce down to 0.01 and 0.001
gse <- gseKEGG(geneList=gene_list, 
               keyType = "kegg", 
               minGSSize = 3, 
               maxGSSize = 800, 
               pvalueCutoff = 0.05, 
               verbose = TRUE,
               pAdjustMethod = "none")

#Draw dotplot
require(DOSE)
dotplot(gse, showCategory=10, split=".sign") + facet_grid(.~.sign)
