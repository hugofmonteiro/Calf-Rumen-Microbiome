# Load libraries
library(ggplot2)
library(reshape2)

# Load ComplexHeatmap
#library(BiocManager)
#BiocManager::install("ComplexHeatmap")

if (!requireNamespace("circlize", quietly = TRUE)) {
  install.packages("circlize")
}

library(ComplexHeatmap)
library(circlize)

# Prepare the data
data_matrix <- as.matrix(sample_data[,-1]) # Remove RFI_groups column and convert to matrix
rownames(data_matrix) <- sample_data$RFI_groups

# Create a fancy heatmap
heatmap <- Heatmap(data_matrix,
                   name = "Value",
                   col = colorRamp2(c(-2, 0, 2), c("blue", "white", "red")),
                   row_names_gp = gpar(fontsize = 12),
                   column_names_gp = gpar(fontsize = 12, fontface = "italic", rot = 70),
                   column_title = "Variables",
                   row_title = "RFI_groups",
                   cluster_rows = FALSE,
                   cluster_columns = FALSE,
                   show_row_names = TRUE,
                   show_column_names = TRUE,
                   row_dend_side = "left",
                   column_dend_side = "top")

draw(heatmap, heatmap_legend_side = "right")
