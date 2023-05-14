#!/usr/bin/env bash

#SBATCH --time=3-00:00:00
#SBATCH --mem-per-cpu=12G
#SBATCH --cpus-per-task=4
#SBATCH --partition=pall
#SBATCH --job-name=flye_polish
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=begin,fail,end
#SBATCH --output=/data/users/hfang/newassembly/polishing/flye/output_flye_%j.o
#SBATCH --error=/data/users/hfang/newassembly/polishing/flye/error_flye_%j.e

#set input and output directory variables
input_raw=/data/users/hfang/newassembly/participant_1/Illumina
input_assemblies=/data/users/hfang/newassembly/assemblies/flye
output_dir=/data/users/hfang/newassembly/polishing/flye

#load the modules
module load UHTS/Aligner/bowtie2/2.3.4.1
module load UHTS/Analysis/samtools/1.10
module load Development/java/11.0.6

#run bowtie2-build to index the assembly
bowtie2-build --threads 4 -f ${input_assemblies}/assembly.fasta ${output_dir}/flye_index

#run bowtie2 in alignment mode --sensitive-local
bowtie2 -p 4 -x ${output_dir}/flye_index -1 ${input_raw}/*_1.fastq.gz -2 ${input_raw}/*_2.fastq.gz \
-q --sensitive-local -S ${output_dir}/flye_polish.sam

#change directory
cd ${output_dir}
#convert to the samfile to bamfile
samtools sort -T $SCRATCH -@ $SLURM_CPUS_PER_TASK flye_polish.sam -o flye_sorted.sam
samtools view -bS flye_sorted.sam -o flye_polish.bam
samtools index flye_polish.bam

#run pilon
java -Xmx45g -jar /mnt/software/UHTS/Analysis/pilon/1.22/bin/pilon-1.22.jar \
--genome ${input_assemblies}/assembly.fasta \
--bam ${output_dir}/flye_polish.bam --outdir ${output_dir} --output pilon
