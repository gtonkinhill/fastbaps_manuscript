FILE="./data/escherichia_coli/escherichia_coli_core_gene_alignment.snps.aln"
NPOP=80
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_rhierbaps.R $FILE $NPOP > "${FILE}_rhierbaps.log" 2>&1 &

FILE="./data/haemophilus_influenzae/haemophilus_influenzae_core_gene_snps.aln"
NPOP=40
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_rhierbaps.R $FILE $NPOP > "${FILE}_rhierbaps.log" 2>&1 &

FILE="./data/listeria_monocytogenes/listeria_monocytogenes_core_gene_snps.aln"
NPOP=40
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_rhierbaps.R $FILE $NPOP > "${FILE}_rhierbaps.log" 2>&1	&

FILE="./data/neisseria_meningitidis/neisseria_meningitidis_core_gene_snps.aln"
NPOP=60
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_rhierbaps.R $FILE $NPOP > "${FILE}_rhierbaps.log" 2>&1	&

FILE="./data/staphylococcus_aureus/staphylococcus_aureus_core_gene_alignment.snps.aln"
NPOP=40
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_rhierbaps.R $FILE $NPOP > "${FILE}_rhierbaps.log" 2>&1	&

FILE="./data/ebola/Makona_1610_cds_ig.fas"
NPOP=150
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_rhierbaps.R $FILE $NPOP > "${FILE}_rhierbaps.log" 2>&1 &

