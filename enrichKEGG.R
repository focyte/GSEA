library(clusterProfiler)
library(org.Hs.eg.db)

# Command-line arguments
args <- commandArgs(trailingOnly = TRUE)

# Check if the required arguments are provided
if (length(args) < 5) {
  stop("Usage: Rscript script.R <input_file> <padj_threshold> <log2FoldChange_threshold> <output_png> <showCategory_number>")
}

# Assign command-line arguments to variables
input_file <- args[1]
padj_threshold <- as.numeric(args[2])
log2FoldChange_threshold <- as.numeric(args[3])
output_png <- args[4]
showCategory_number <- as.numeric(args[5])

# Load homo sapiens organism database
org_db <- 'org.Hs.eg.db'
if (!requireNamespace(org_db, quietly = TRUE)) {
  install.packages(org_db)
}
library(org.Hs.eg.db)

# Load a csv file of your gene expression data
dge <- read.csv(input_file, row.names = 1)

# Convert gene symbols into ENTREZ IDs
dge["ENTREZID"] <- mapIds(org.Hs.eg.db, row.names(dge), 'ENTREZID', 'SYMBOL')

dge <- dge[complete.cases(dge), ]

# Set the cut-offs for padj and log2FoldChange
dge <- dge[(dge["padj"] < padj_threshold) & (abs(dge["log2FoldChange"]) > log2FoldChange_threshold),]

# Perform KEGG pathway enrichment analysis
kk <- enrichKEGG(gene = dge[["ENTREZID"]],
                 organism = 'hsa',
                 pvalueCutoff = 0.05)

# Create a dotplot and save it as a PNG file
dotplot(kk, showCategory = showCategory_number)
ggsave(output_png, plot = last_plot(), device = "png")
