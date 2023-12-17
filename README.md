# Gene Set Enrichment Analysis (GSEA)

This repository contains R scripts for performing gene enrichment analysis using the `clusterProfiler` and `DOSE` packages in R. The scripts utilize the `enrichKEGG` and `gseKEGG` functions for KEGG pathway analysis.

## Prerequisites

Make sure you have the following R packages installed:

- `clusterProfiler`
- `enrichplot`
- `ggplot2`
- `DOSE`

You can install them using the following R commands:

```R
install.packages(c("clusterProfiler", "enrichplot", "ggplot2", "DOSE"))
```

## Usage

### enrichKEGG Script

The enrichKEGG script performs KEGG pathway enrichment analysis using the clusterProfiler package.

Command-line Arguments
<input_file>: CSV file containing gene expression data.
<padj_threshold>: p-value adjusted threshold for filtering genes.
<log2FoldChange_threshold>: Log2 fold change threshold for filtering genes.
<output_png>: Output PNG file for the dotplot.
<showCategory_number>: Number of categories to show in the dotplot.

```bash
Rscript enrichKEGG.R input.csv 0.05 0.5 output_plot.png 15
```

```console
Rscript --vanilla enrichKEGG.R significant_genes.csv 0.05 0.5 1.png 15
```

### gseKEGG Script

The gseKEGG script performs KEGG pathway enrichment analysis using the DOSE package.

Command-line Arguments
<input_file>: CSV file containing gene expression data.

```bash
Rscript script.R input.csv 0.05 10
```


