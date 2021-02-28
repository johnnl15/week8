#!/bin/bash
#SBATCH --job-name=test      ## Name of the job.
#SBATCH -A ecoevo283         ## account to charge 
#SBATCH -p standard          ## partition/queue name
#SBATCH --array=1-17         ## normal wc -l $file is helpful ... but only the first 17 chromosomes are not junkola 
#SBATCH --cpus-per-task=1    ## number of cores the job needs, can the programs you run make used of multiple cores?

module load java/1.8.0
module load gatk/4.1.9.0

ref="mydata/ref/dmel-all-chromosome-r6.13.fasta"
dir="AdvancedInformatics2021Directory/johnnl15/johnnl15"

interval=`head -n $SLURM_ARRAY_TASK_ID my_regions_4Mb.txt | tail -n 1`
/opt/apps/gatk/4.1.9.0/gatk GenotypeGVCFs -R $dir/$ref -V $dir/mydata/DNAseqout/rawdata/allsample.g.vcf.gz --intervals $interval -stand-call-conf 5 -O $dir/mydata/DNAseqout/rawdata/SNPbyregion/$interval.vcf.gz

