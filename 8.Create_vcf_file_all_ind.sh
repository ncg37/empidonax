#Create vcf with all (pure song and inter-song) individuals (34 samples) and filter

nohup java -jar -Xmx100g /programs/bin/GATK/GenomeAnalysisTK.jar -nt 5 -T GenotypeGVCFs  -R ./pseudochromosomes_etrailli.fasta \
--variant R1.g.vcf \
--variant R2.g.vcf \
--variant R3.g.vcf \
--variant R4.g.vcf \
--variant R5.g.vcf \
--variant R6.g.vcf \
--variant R7.g.vcf \
--variant R8.g.vcf \
--variant R9.g.vcf \
--variant R10.g.vcf \
--variant R1ad.g.vcf \
--variant R2ad.g.vcf \
--variant R3ad.g.vcf \
--variant R4ad.g.vcf \
--variant R5ad.g.vcf \
--variant R6ad.g.vcf \
--variant R7ad.g.vcf \
--variant R8ad.g.vcf \
--variant R9ad.g.vcf \
--variant R10ad.g.vcf \
--variant R11ad.g.vcf \
--variant R12ad.g.vcf \
--variant R13ad.g.vcf \
--variant R14ad.g.vcf \
--variant R15ad.g.vcf \
--variant R16ad.g.vcf \
--variant R17ad.g.vcf \
--variant R18ad.g.vcf \
--variant R19ad.g.vcf \
--variant R21ad.g.vcf \
--variant R22.g.vcf \
--variant R23.g.vcf \
--variant R24.g.vcf \
--variant R25.g.vcf \
-o UNFILTERED_TOTAL.vcf &

bgzip -c UNFILTERED_TOTAL.vcf > UNFILTERED_TOTAL.vcf.gz &
tabix -p vcf UNFILTERED_TOTAL.vcf.gz &
nohup bcftools stats UNFILTERED_TOTAL.vcf.gz  > UNFILTERED_TOTAL.stats &

nohup cp /local/workdir/ncg37/UNFILTERED_TOTAL.vcf /home/lc736_0001/ncg37/zebrafinch/RUSH2   &

nohup java -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T SelectVariants -R ./pseudochromosomes_etrailli.fasta  -V UNFILTERED_TOTAL.vcf -selectType SNP -o todos_snps.vcf &


nohup java -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T VariantFiltration -R ./pseudochromosomes_etrailli.fasta \
    -V todos_snps.vcf \
    --filterExpression "QD < 2.0 || FS > 60.0 || MQ < 20.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
    --filterName "hard_snp_filter" \
    -o filtered_todos_snps.vcf &

nohup vcftools --vcf filtered_todos_snps.vcf  --remove-filtered-all --recode --out removed_filtered_todos_snps &

nohup vcftools --vcf ./removed_filtered_todos_snps.recode.vcf --max-missing 0.8 --min-meanDP 3 --mac 3 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --remove-filtered-all --recode --out final_filter_todos &

###Creating vcf files for PCA based on near fixed SNPs per chromosome, requires list of near fixed SNPs in outlier areas positions452.txt  (for figure 5a)

vcftools --vcf final_filter_todos.recode.vcf --positions positions452.txt  --remove-filtered-all --recode --out filtered_452SNPs &

nohup vcftools --vcf filtered_452SNPs.recode.vcf --chr PseudoCM012081.1_Taeniopygia_guttata_isolate_Black17_chromosome_1,_whole_genome_shotgun_sequence  --remove-filtered-all --recode --out filtered_fixedSNP_chr1 &
nohup vcftools --vcf filtered_452SNPs.recode.vcf --chr PseudoCM012082.1_Taeniopygia_guttata_isolate_Black17_chromosome_1A,_whole_genome_shotgun_sequence  --remove-filtered-all --recode --out filtered_fixedSNP_chr1A &
nohup vcftools --vcf filtered_452SNPs.recode.vcf --chr PseudoCM012083.1_Taeniopygia_guttata_isolate_Black17_chromosome_2,_whole_genome_shotgun_sequence  --remove-filtered-all --recode --out filtered_fixedSNP_chr2 &
nohup vcftools --vcf filtered_452SNPs.recode.vcf --chr PseudoCM012092.1_Taeniopygia_guttata_isolate_Black17_chromosome_10,_whole_genome_shotgun_sequence   --remove-filtered-all --recode --out filtered_fixedSNP_chr10 &
nohup vcftools --vcf filtered_452SNPs.recode.vcf --chr PseudoCM012100.1_Taeniopygia_guttata_isolate_Black17_chromosome_18,_whole_genome_shotgun_sequence  --remove-filtered-all --recode --out filtered_fixedSNP_chr18 &
nohup vcftools --vcf filtered_452SNPs.recode.vcf --chr PseudoCM012113.1_Taeniopygia_guttata_isolate_Black17_chromosome_Z,_whole_genome_shotgun_sequence  --remove-filtered-all --recode --out filtered_fixedSNP_chrZ &