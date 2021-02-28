#!/bin/bash
#SBATCH --job-name=RNAseq      ## Name of the job.
#SBATCH -A ecoevo283         ## account to charge 
#SBATCH -p standard          ## partition/queue name
#SBATCH --array=1-4         ## number of tasks to launch, given hint below wc -l $file is helpful
#SBATCH --cpus-per-task=2    ## number of cores the job needs, can the programs you run make used of multiple cores?

module load subread/2.0.1

ref="mydata/ref/dmel-all-chromosome-r6.13.fasta"
dir="AdvancedInformatics2021Directory/johnnl15/johnnl15"

gtf="$dir/mydata/ref/dmel-all-r6.13.gtf"
myfile=`cat shortRNAseq.names.txt|sed 's/RNAseq/RNAseqout/'| sed 's/$/.bam/' |tr "\n" " "`
featureCounts -p -T 4 -t exon -g gene_id -Q 30 -F GTF -a $gtf -o fly_counts_2.txt $myfile






