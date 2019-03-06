library(fastbaps)
library(Matrix)
library(ape)

#dont time pre-processing phylogeny ext. In practive this takes very little time anyway
hiv.data <- import_fasta_sparse_nt("./data/HIV/hiv_refs_prrt_trim.fas", prior = "baps")

#remove poor quality sequences
cs <- colSums(hiv.data$snp.matrix>0)
hiv.data$snp.matrix <- hiv.data$snp.matrix[,cs<200]

#Load phylogeny and remove the same low quality sequences
tree <- ape::read.tree("./data/HIV/hiv_refs_prrt_trim.fas.fasttree")

# run fastbaps
best.baps.partition <- fastbaps::best_baps_partition(hiv.data, tree)

multi.results <- data.frame(Isolate=names(best.baps.partition),
                            Cluster=best.baps.partition, stringsAsFactors = FALSE)

write.csv(multi.results, file = "hiv_fastbaps_fasttree_best_partition_baps_prior.csv",
          col.names = TRUE, row.names = FALSE, quote = FALSE)