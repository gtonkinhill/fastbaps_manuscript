library(rhierbaps)

args <- commandArgs(trailingOnly=TRUE)

fasta.file.name <- args[[1]]
n.pops <- as.numeric(args[[2]])

snp.matrix <- load_fasta(fasta.file.name)
hb.results <- hierBAPS(snp.matrix, max.depth = 2, n.pops = n.pops, quiet = FALSE, n.cores = 5)

pre.name <- tools::file_path_sans_ext(fasta.file.name)

write.csv(hb.results$partition.df, file = paste(pre.name, "hierbaps_partition.csv", sep="_"), 
          col.names = TRUE, row.names = FALSE, quote = FALSE)

save_lml_logs(hb.results, paste(pre.name, "hierbaps_logML.txt", sep="_"))
