#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/users/hfang/newassembly/read_QC/fastqc/RNAseq/output_fastqc_%j.o
#SBATCH --error=/data/users/hfang/newassembly/read_QC/fastqc/RNAseq/error_fastqc_%j.e
#SBATCH --partition=pall


module add UHTS/Quality_control/fastqc/0.11.9

INPUT_FILES=/data/users/hfang/newassembly/participant_1/RNAseq

OUTPUT_DIR=/data/users/hfang/newassembly/read_QC/fastqc/RNAseq

fastqc --extract $INPUT_FILES/*.fastq.gz --threads 1 -o $OUTPUT_DIR