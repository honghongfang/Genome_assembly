#!/usr/bin/env bash

#SBATCH --time=06:00:00
#SBATCH --mem-per-cpu=6G
#SBATCH --cpus-per-task=16
#SBATCH --partition=pall
#SBATCH --job-name=flye_assembly
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,end
#SBATCH --output=/data/users/hfang/newassembly/assemblies/flye/output_flye_%j.o
#SBATCH --error=/data/users/hfang/newassembly/assemblies/flye/error_flye_%j.e

#set input and output directory variables
input_dir=/data/users/hfang/newassembly/participant_1/pacbio
output_dir=/data/users/hfang/newassembly/assemblies/flye

#load the module
module load UHTS/Assembler/flye/2.8.3

#run flye
flye --pacbio-raw ${input_dir}/* --out-dir ${output_dir} --threads 16 --genome-size 130M
