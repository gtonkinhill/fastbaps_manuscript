library(adegenet)
library(ape)
library(parallel)
library(fastbaps)
library(Matrix)


fasta.file.name <- "./data/HIV/hiv_refs_prrt_trim.fas"
pre.name <- tools::file_path_sans_ext(fasta.file.name)

hiv.data <- import_fasta_sparse_nt("./data/HIV/hiv_refs_prrt_trim.fas", prior = "baps")
cs <- colSums(hiv.data$snp.matrix>0)
bad.isolates <- colnames(hiv.data$snp.matrix)[cs>=200]

snp.data <- ape::read.FASTA(fasta.file.name)
snp.data <- snp.data[!(names(snp.data) %in% bad.isolates)]

snp.data <- adegenet::DNAbin2genind(snp.data)
snap.clust.results <- adegenet::snapclust(snp.data, k = 193, pop.ini = "kmeans")

cluster.results <- snap.clust.results$group
cluster.results <- cbind(rownames(cluster.results), cluster.results)
colnames(cluster.results) <- c("Isolate", "K=193")

write.table(cluster.results, file = paste(pre.name, "snapclust_results.csv", sep="_"),
            quote = FALSE, col.names = TRUE, row.names = FALSE)

