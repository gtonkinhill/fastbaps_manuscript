nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_fastbaps_optbapsprior.R > ./data/HIV_run_fastbaps_optbapsprior.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_fastbaps_symmetric.R > ./data/HIV_run_fastbaps_symmetric.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_baps_prior.R > ./data/HIV_run_baps_prior.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_ward_bbp.R > ./data/HIV_run_ward_bbp.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/run_fastbaps_HIV_fasttree.R > ./data/HIV_run_fasttree_bp.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_baps_prior.R > ./data/HIV_run_baps_prior.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_baps_prior_genie.R > ./data/HIV_run_baps_prior_genie.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_baps_prior_initK1000.R > ./data/HIV_run_baps_prior_initK1000.log 2>&1 &


nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_baps_fasttree_diff_sizes.R > ./data/HIV_run_baps_prior_fasttree_diff_sizes.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/HIV_run_baps_prior_diff_sizes.R > ./data/HIV_run_baps_prior_diff_sizes.log 2>&1 &

nohup /usr/bin/time -v Rscript --vanilla ./fastbaps_manuscript/scripts/scripts/run_baps_genie_diff_sizes.R > ./data/HIV_run_baps_prior_genie_diff_sizes.log 2>&1 &