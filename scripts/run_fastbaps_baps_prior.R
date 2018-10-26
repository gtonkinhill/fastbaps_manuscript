library(fastbaps)

args <- commandArgs(trailingOnly=TRUE)

fasta.file.name <- args[[1]]

sparse.data <- import_fasta_sparse_nt(fasta.file.name, prior = "baps")
multi.results <- multi_res_baps(sparse.data, levels = 1, n.cores = 5)

pre.name <- tools::file_path_sans_ext(fasta.file.name)

write.csv(multi.results, file = paste(pre.name, "fastbaps_partition_baps_prior_l1.csv", sep="_"), 
          col.names = TRUE, row.names = FALSE, quote = FALSE)
