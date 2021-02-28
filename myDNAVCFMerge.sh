#!/bin/bash
#SBATCH --job-name=DNAVCFMerge      ## Name of the job.
#SBATCH -A ecoevo283         ## account to charge 
#SBATCH -p standard          ## partition/queue name
#SBATCH --cpus-per-task=2    ## number of cores the job needs, can the programs you run make used of multiple cores?

module load java/1.8.0
module load gatk/4.1.9.0

ref="mydata/ref/dmel-all-chromosome-r6.13.fasta"
dir="AdvancedInformatics2021Directory/johnnl15/johnnl15"

# another dirty shell trick, you can't printf -V...
/opt/apps/gatk/4.1.9.0/gatk CombineGVCFs -R $dir/$ref $(printf -- '-V %s ' $dir/mydata/DNAseqout/rawdata/*.g.vcf.gz) -O $dir/mydata/DNAseqout/rawdata/allsample.g.vcf.gz
## and merge gVCFs

