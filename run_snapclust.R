library(adegenet)
library(ape)
library(parallel)

args <- commandArgs(trailingOnly=TRUE)

fasta.file.name <- args[[1]]
max.k <- as.numeric(args[[2]])
pre.name <- tools::file_path_sans_ext(fasta.file.name)


snp.data <- ape::read.FASTA(fasta.file.name)
snp.data <- adegenet::DNAbin2genind(snp.data)
snap.clust.results <- parallel::mclapply(c(max.k), function(k) {adegenet::snapclust(snp.data, k = k)}, mc.cores = 5)
snap.clust.bic <- unlist(parallel::mclapply(snap.clust.results, adegenet::BIC.snapclust, mc.cores = 5))
snap.clust.aic <- unlist(parallel::mclapply(snap.clust.results, adegenet::AIC.snapclust, mc.cores = 5))

#cluster.results <- as.data.frame(do.call(cbind, lapply(snap.clust.results, function(x) x$group)))
#cluster.results <- cbind(rownames(cluster.results), cluster.results)
#colnames(cluster.results) <- c("Isolate", paste("K", 2:max.k, sep="_"))

#write.table(cluster.results, file = paste(pre.name, "snapclust_results.csv", sep="_"),
#            quote = FALSE, col.names = TRUE, row.names = FALSE)

#run.summaries <- data.frame(K = 2:max.k,
#           AIC = snap.clust.aic,
#           BIC = snap.clust.bic,
#           do.call(rbind, lapply(snap.clust.results, function(x) c(x$ll, x$n.param, x$converged, x$n.iter))),
#           stringsAsFactors = FALSE)
#colnames(run.summaries)[4:7] <- c("log.lk", "n.param", "converged", "n.iter")
#
#write.table(run.summaries, file = paste(pre.name, "snapclust_run_summary.csv", sep="_"),
#            quote = FALSE, col.names = TRUE, row.names = FALSE)
