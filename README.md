# Genome_assembly

#Course description
NGS technologies allow researchers to sequence genomes and transcriptomes of almost any organism within a few days.
However, the assembly and annotation is still very challenging and requires a deep understanding of assembly algorithms and sequencing technologies.

#Learning outcomes
Empower the students to independently de novo assemble genomes and transcriptomes 2nd and 3rd generation sequencing. Students (i) learn the theory of algorithmic assembly
principles, (ii) apply it to data sets of both model & non-model organisms, (iii) assess the quality along the complete process from data generation to the 
genome/transcriptome assembly itself, (iv) annotate the genome by mapping the transcriptome assembly data to genome assembly data.

#Datasets
The datasets used in this course originate from:
Jiao WB, Schneeberger K. Chromosome-level assemblies of multiple Arabidopsis genomes reveal hotspots of rearrangements with altered evolutionary dynamics. Nature 
Communications. 2020;11:1–10. Available from: http://dx.doi.org/10.1038/s41467-020-14779-y

#Working reproducible
You are very much encouraged to use the basic principles for reproducibility:

1.Execute the commands from a script in order to be able to trace back your steps
2.Number scripts based on their order of execution (e.g. 01_download_reads.sh)
3.Give your scripts a descriptive and active name, e.g. 06_build_bowtie_index.sh
4.Make your scripts specific, i.e. do not combine many different commands in the same script
5.Refer to directories and variables at the beginning of the script
