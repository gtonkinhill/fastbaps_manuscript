library(fastbaps)
library(Matrix)

#dont time pre-processing phylogeny ext. In practive this takes very little time anyway
hiv.data <- import_fasta_sparse_nt("./data/HIV/hiv_refs_prrt_trim.fas", prior = "baps")

#remove poor quality sequences
cs <- colSums(hiv.data$snp.matrix>0)
hiv.data$snp.matrix <- hiv.data$snp.matrix[,cs<200]

system.time({hiv.data <- optimise_prior(hiv.data, type = "optimise.baps", n.cores = 10)})

system.time({hiv.multi <- multi_res_baps(hiv.data, levels = 1, n.cores = 10, k.init = 11000)})

write.csv(hiv.multi, file="hiv_multi_opt_baps_prior_l1.csv", quote=FALSE)

write.csv(multi.results, file = paste(pre.name, "hiv_fastbaps_partition_optbapsprior_l1.csv", sep="_"), 
          col.names = TRUE, row.names = FALSE, quote = FALSE)
