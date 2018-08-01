FILE="./data/escherichia_coli/escherichia_coli_core_gene_alignment.snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_fastbaps_baps_optbaps_prior.R $FILE > "${FILE}_fastbaps_optbaps_prior.log" 2>&1 &

FILE="./data/haemophilus_influenzae/haemophilus_influenzae_core_gene_snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_fastbaps_baps_optbaps_prior.R $FILE > "${FILE}_fastbaps_optbaps_prior.log" 2>&1 &

FILE="./data/listeria_monocytogenes/listeria_monocytogenes_core_gene_snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_fastbaps_baps_optbaps_prior.R $FILE > "${FILE}_fastbaps_optbaps_prior.log" 2>&1	&

FILE="./data/neisseria_meningitidis/neisseria_meningitidis_core_gene_snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_fastbaps_baps_optbaps_prior.R $FILE > "${FILE}_fastbaps_optbaps_prior.log" 2>&1	&

FILE="./data/staphylococcus_aureus/staphylococcus_aureus_core_gene_alignment.snps.aln"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_fastbaps_baps_optbaps_prior.R $FILE > "${FILE}_fastbaps_optbaps_prior.log" 2>&1	&

FILE="./data/ebola/Makona_1610_cds_ig.fas"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_fastbaps_baps_optbaps_prior.R $FILE > "${FILE}_fastbaps_optbaps_prior.log" 2>&1 &

FILE="./data/maela/maela3k_snps.fasta"
nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/run_fastbaps_baps_optbaps_prior.R $FILE > "${FILE}_fastbaps_optbaps_prior.log" 2>&1 &
