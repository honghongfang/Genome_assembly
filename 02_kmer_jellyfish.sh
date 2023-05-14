#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=10000M
#SBATCH --time=02:00:00
#SBATCH --job-name=kmer
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=begin,fail,end
#SBATCH --output=/data/users/hfang/newassembly/read_QC/kmer_counting/output_kmer_%j.o
#SBATCH --error=/data/users/hfang/newassembly/read_QC/kmer_counting/error_kmer_%j.e
#SBATCH --partition=pall

#load jellyfish module
module load UHTS/Analysis/jellyfish/2.3.0

#set directory variables
input_dir=/data/users/hfang/newassembly/participant_1
output_dir=/data/users/hfang/newassembly/read_QC/kmer_counting

#execute jellyfish, as you want to lower errors, you should go with illumina
#but we will do it with both, just to see the difference
jellyfish count -C -m 21 -s 5G -t 4 <(zcat ${input_dir}/Illumina/*.fastq.gz) -o ${output_dir}/illumina_reads.jf

jellyfish count -C -m 21 -s 5G -t 4 <(zcat ${input_dir}/pacbio/*.fastq.gz) -o ${output_dir}/pacbio_reads.jf

# create the histograms
jellyfish histo -t 10 ${output_dir}/illumina_reads.jf > ${output_dir}/illumina_reads.histo

jellyfish histo -t 10 ${output_dir}/pacbio_reads.jf > ${output_dir}/pacbio_reads.histo
