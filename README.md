## Assignment 8 022821

First make a file called [prefix2](prefix2.txt) for merging of my replicate lanes. 

Then I run my [Merge replicate lane](myMergeSNPjob.sh). 

I will combine my GVCF files together [combine](myDNAVCFMerge.sh). 

I will call my [SNPs](myCallSNP.sh). 

I also did the [breakup method](myBreakSNP.sh). Before running this script, I need to designate my chromosome regionsand use a [helper script](fasta_generate_regions.py). 

```

ref="mydata/ref/dmel-all-chromosome-r6.13.fasta"
dir="AdvancedInformatics2021Directory/johnnl15/johnnl15"
python3 fasta_generate_regions.py $dir/$ref 10000000 >my_regions_4Mb.txt

```

But i'm having trouble figuring out how to merge my VCF files. I'll need suggestions for that.

For my RNAseq dataset, I'll use this [script](myRNAREADcount.sh) for RNA counting.  
