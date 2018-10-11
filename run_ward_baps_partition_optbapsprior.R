library(fastbaps)

args <- commandArgs(trailingOnly=TRUE)

fasta.file.name <- args[[1]]

sparse.data <- import_fasta_sparse_nt(fasta.file.name, prior = "baps")
sparse.data <- optimise_prior(sparse.data, type = "optimise.baps")

pc <- irlba::prcomp_irlba(1*t(sparse.data$snp.matrix>0), n=10)
h <- fastcluster::hclust.vector(pc$x, method = "ward")
h$labels <- colnames(sparse.data$snp.matrix)
ward.best.baps.partition <- fastbaps::best_baps_partition(sparse.data, h)

pre.name <- tools::file_path_sans_ext(fasta.file.name)

write.csv(multi.results, file = paste(pre.name, "fastbaps_ward_best_partition_optbaps_prior.csv", sep="_"), 
          col.names = TRUE, row.names = FALSE, quote = FALSE)
