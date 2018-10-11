FILE="./data/escherichia_coli/escherichia_coli_core_gene_alignment.snps.aln"
# MAXK=50
MAXK=38
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_snapclust.R $FILE $MAXK > "${FILE}.snapclust.3.log" 2>&1 &

MAXK=8
FILE="./data/haemophilus_influenzae/haemophilus_influenzae_core_gene_snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_snapclust.R $FILE $MAXK > "${FILE}.snapclust.3.log" 2>&1 &

MAXK=5
FILE="./data/listeria_monocytogenes/listeria_monocytogenes_core_gene_snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_snapclust.R $FILE $MAXK > "${FILE}.snapclust.3.log" 2>&1	&

MAXK=30
FILE="./data/neisseria_meningitidis/neisseria_meningitidis_core_gene_snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_snapclust.R $FILE $MAXK > "${FILE}.snapclust.3.log" 2>&1	&

MAXK=12
FILE="./data/staphylococcus_aureus/staphylococcus_aureus_core_gene_alignment.snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_snapclust.R $FILE $MAXK > "${FILE}.snapclust.3.log" 2>&1	&

MAXK=27
FILE="./data/ebola/Makona_1610_cds_ig.fas"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_snapclust.R $FILE $MAXK > "${FILE}.snapclust.3.log" 2>&1 &