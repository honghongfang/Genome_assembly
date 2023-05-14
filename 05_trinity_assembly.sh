#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=12
#SBATCH --partition=pall
#SBATCH --job-name=trinity_assembly
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,end
#SBATCH --output=/data/users/hfang/newassembly/assemblies/trinity/output_trinity_%j.o
#SBATCH --error=/data/users/hfang/newassembly/assemblies/trinity/error_trinity_%j.e

#set input and output directory variables
input_dir=/data/users/hfang/newassembly/participant_1/RNAseq
output_dir=/data/users/hfang/newassembly/assemblies/trinity

#load the module
module load UHTS/Assembler/trinityrnaseq/2.5.1

#run trinity
Trinity --seqType fq --left ${input_dir}/ERR754081_1.fastq.gz \
--right ${input_dir}/ERR754081_2.fastq.gz \
--CPU 12 --max_memory 48G --output ${output_dir}
