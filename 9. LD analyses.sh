###LD analyses###
#requires files final_filter_todos.recode.vcf from script 8, list of near fixed SNPs in outlier areas positions452.txt and list of pure-song individuals pures.sh


#LD analysis for near fixed SNPs in oulier areas in all chromosomes for pure-song and inter-song individuals (for figure 5b)

vcftools --vcf final_filter_todos.recode.vcf --positions positions452.txt  --remove-filtered-all --recode --out filtered_452SNPs &

vcftools --vcf filtered_452SNPs.recode.vcf  --remove-filtered-all --keep pures.sh  --recode --out filtered_452SNPs_pures &
vcftools --vcf filtered_452SNPs.recode.vcf  --remove-filtered-all --remove pures.sh  --recode --out filtered_452SNPs_admixed &

nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./filtered_452SNPs_pures.recode.vcf   --allow-extra-chr  --r2 square --out filtered_452SNPs_pures_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./filtered_452SNPs_admixed.recode.vcf  --allow-extra-chr  --r2 square  --out filtered_452SNPs_admix_LD &

#LD analysis for the outlier areas in each chromosome (±100 kbp) based on SNPs with a minimum allele frequency of 0.25 (for figure S2c)

nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012081.1_Taeniopygia_guttata_isolate_Black17_chromosome_1,_whole_genome_shotgun_sequence --remove-filtered-all --from-bp 11725000  --to-bp 12300000 --keep pures.sh --maf 0.25 --recode  --out maf025_chr1_pures_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012082.1_Taeniopygia_guttata_isolate_Black17_chromosome_1A,_whole_genome_shotgun_sequence --remove-filtered-all --from-bp 61675000  --to-bp 62650000 --keep pures.sh  --maf 0.25 --recode  --out maf025_chr1A_pures_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012083.1_Taeniopygia_guttata_isolate_Black17_chromosome_2,_whole_genome_shotgun_sequence --remove-filtered-all --from-bp 57725000  --to-bp 58275000 --keep pures.sh  --maf 0.25 --recode  --out maf025_chr2_pures_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012092.1_Taeniopygia_guttata_isolate_Black17_chromosome_10,_whole_genome_shotgun_sequence  --remove-filtered-all --from-bp 20725000  --to-bp 21000000 --keep pures.sh --maf 0.25 --recode  --out maf025_chr10_pures_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012100.1_Taeniopygia_guttata_isolate_Black17_chromosome_18,_whole_genome_shotgun_sequence  --remove-filtered-all --from-bp 525000  --to-bp 825000 --keep pures.sh --maf 0.25 --recode  --out maf025_chr18_pures_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012113.1_Taeniopygia_guttata_isolate_Black17_chromosome_Z,_whole_genome_shotgun_sequence  --remove-filtered-all --from-bp 27850000  --to-bp 33200000 --keep pures.sh --maf 0.25 --recode  --out maf025_chrZ_pures_LD &

nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012081.1_Taeniopygia_guttata_isolate_Black17_chromosome_1,_whole_genome_shotgun_sequence --remove-filtered-all --from-bp 11725000  --to-bp 12300000 --remove pures.sh --maf 0.25 --recode  --out maf025_chr1_admix_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012082.1_Taeniopygia_guttata_isolate_Black17_chromosome_1A,_whole_genome_shotgun_sequence --remove-filtered-all --from-bp 61675000  --to-bp 62650000 --remove pures.sh  --maf 0.25 --recode  --out maf025_chr1A_admix_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012083.1_Taeniopygia_guttata_isolate_Black17_chromosome_2,_whole_genome_shotgun_sequence --remove-filtered-all --from-bp 57725000  --to-bp 58275000 --remove pures.sh  --maf 0.25 --recode  --out maf025_chr2_admix_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012092.1_Taeniopygia_guttata_isolate_Black17_chromosome_10,_whole_genome_shotgun_sequence  --remove-filtered-all --from-bp 20725000  --to-bp 21000000 --remove pures.sh --maf 0.25 --recode  --out maf025_chr10_admix_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012100.1_Taeniopygia_guttata_isolate_Black17_chromosome_18,_whole_genome_shotgun_sequence  --remove-filtered-all --from-bp 525000  --to-bp 825000 --remove pures.sh --maf 0.25 --recode  --out maf025_chr18_admix_LD &
nohup vcftools --vcf ./final_filter_todos.recode.vcf  --chr PseudoCM012113.1_Taeniopygia_guttata_isolate_Black17_chromosome_Z,_whole_genome_shotgun_sequence  --remove-filtered-all --from-bp 27850000  --to-bp 33200000 --remove pures.sh --maf 0.25 --recode  --out maf025_chrZ_admix_LD &

nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr1_admix_LD.recode.vcf   --allow-extra-chr  --r2 square --out maf025_chr1_admix_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr1A_admix_LD.recode.vcf   --allow-extra-chr  --r2 square  --out maf025_chr1A_admix_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr2_admix_LD.recode.vcf   --allow-extra-chr  --r2 square  --out maf025_chr2_admix_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr10_admix_LD.recode.vcf   --allow-extra-chr  --r2 square   --out maf025_chr10_admix_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr18_admix_LD.recode.vcf   --allow-extra-chr  --r2 square   --out maf025_chr18_admix_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chrZ_admix_LD.recode.vcf   --allow-extra-chr  --r2  square  --out maf025_chrZ_admix_LD &

nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr1_pures_LD.recode.vcf   --allow-extra-chr  --r2 square --out maf025_chr1_pures_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr1A_pures_LD.recode.vcf   --allow-extra-chr  --r2 square  --out maf025_chr1A_pures_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr2_pures_LD.recode.vcf   --allow-extra-chr  --r2 square  --out maf025_chr2_pures_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr10_pures_LD.recode.vcf   --allow-extra-chr  --r2 square   --out maf025_chr10_pures_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chr18_pures_LD.recode.vcf   --allow-extra-chr  --r2 square   --out maf025_chr18_pures_LD &
nohup /programs/plink-1.9-x86_64-beta5/plink --vcf ./maf025_chrZ_pures_LD.recode.vcf   --allow-extra-chr  --r2  square  --out maf025_chrZ_pures_LD &
