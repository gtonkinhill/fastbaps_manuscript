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
bad.tips <- tree$tip.label[!(tree$tip.label %in% colnames(hiv.data$snp.matrix))]
tree <- ape::drop.tip(tree, tip = bad.tips)

# we also root the tree. This is not perfect but the tree is unlikely to be perfect and we are rather focusing on computational performance here.
longest.edge <- tree$edge[order(-tree$edge.length)][1:100]
long.nodes <- tree$edge[longest.edge,]     #this should usually include one tip
new.outgroup <- long.nodes[long.nodes < Ntip(tree)][[1]]
tree.rooted <- root(tree, outgroup=new.outgroup, resolve.root=TRUE)

# run fastbaps
best.baps.partition <- fastbaps::best_baps_partition(hiv.data, tree.rooted)

multi.results <- data.frame(Isolate=names(best.baps.partition),
                            Cluster=best.baps.partition, stringsAsFactors = FALSE)

write.csv(multi.results, file = "hiv_fastbaps_fasttree_best_partition_baps_prior.csv",
          col.names = TRUE, row.names = FALSE, quote = FALSE)