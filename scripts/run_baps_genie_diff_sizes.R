library(fastbaps)
library(Matrix)
library(ape)


#dont time pre-processing phylogeny ext. In practive this takes very little time anyway
hiv.data <- import_fasta_sparse_nt("./data/HIV/hiv_refs_prrt_trim.fas", prior = "baps")

#remove poor quality sequences
cs <- colSums(hiv.data$snp.matrix>0)
hiv.data$snp.matrix <- hiv.data$snp.matrix[,cs<200]

temp.data <- hiv.data
temp.data$snp.matrix <- temp.data$snp.matrix[, sample(1:ncol(temp.data$snp.matrix), 1000)]
temp.data <- optimise_prior(temp.data, type = 'baps')
system.time({hiv.multi <- multi_res_baps(temp.data, levels = 1, n.cores = 10, hc.method = "genie")})

temp.data <- hiv.data
temp.data$snp.matrix <- temp.data$snp.matrix[,  sample(1:ncol(temp.data$snp.matrix), 10000)]
temp.data <- optimise_prior(temp.data, type = 'baps')
system.time({hiv.multi <- multi_res_baps(temp.data, levels = 1, n.cores = 10, hc.method = "genie")})

temp.data <- hiv.data
temp.data$snp.matrix <- temp.data$snp.matrix[, sample(1:ncol(temp.data$snp.matrix), 100000)]
temp.data <- optimise_prior(temp.data, type = 'baps')
system.time({hiv.multi <- multi_res_baps(temp.data, levels = 1, n.cores = 10, hc.method = "genie")})

