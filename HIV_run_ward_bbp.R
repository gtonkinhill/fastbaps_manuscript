library(fastbaps)
library(Matrix)

#dont time pre-processing phylogeny ext. In practive this takes very little time anyway
hiv.data <- import_fasta_sparse_nt("./data/HIV/hiv_refs_prrt_trim.fas", prior = "baps")

#remove poor quality sequences
cs <- colSums(hiv.data$snp.matrix>0)
hiv.data$snp.matrix <- hiv.data$snp.matrix[,cs<200]

hiv.data <- optimise_prior(hiv.data, type = "optimise.baps")

pc <- irlba::prcomp_irlba(1*t(hiv.data$snp.matrix>0), n=10)
h <- fastcluster::hclust.vector(pc$x, method = "ward")
h$labels <- colnames(hiv.data$snp.matrix)
ward.best.baps.partition <- fastbaps::best_baps_partition(hiv.data, h)

multi.results <- data.frame(Isolate=names(ward.best.baps.partition),
                            Cluster=ward.best.baps.partition, stringsAsFactors = FALSE)

write.csv(multi.results, file = paste(pre.name, "hiv_fastbaps_ward_best_partition_optbaps_prior.csv", sep="_"),
          col.names = TRUE, row.names = FALSE, quote = FALSE)