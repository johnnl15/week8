#!/bin/bash
#SBATCH --job-name=callSNPS      ## Name of the job.
#SBATCH -A ecoevo283         ## account to charge 
#SBATCH -p standard          ## partition/queue name
#SBATCH --cpus-per-task=1    ## number of cores the job needs, can the programs you run make used of multiple cores?

module load java/1.8.0
module load gatk/4.1.9.0

ref="mydata/ref/dmel-all-chromosome-r6.13.fasta"
dir="AdvancedInformatics2021Directory/johnnl15/johnnl15"

/opt/apps/gatk/4.1.9.0/gatk GenotypeGVCFs -R $dir/$ref -V $dir/mydata/DNAseqout/rawdata/allsample.g.vcf.gz -stand-call-conf 5 -O $dir/mydata/DNAseqout/rawdata/result.vcf.gz
## end call SNPs

