#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=02:00:00
#SBATCH --job-name=mummer_flye
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,begin,end
#SBATCH --output=/data/users/hfang/newassembly/evaluations/flye/mummer/output_mummer_flye_%j.o
#SBATCH --error=/data/users/hfang/newassembly/evaluations/flye/mummer/error_mummer_flye_%j.e
#SBATCH --partition=pall

#set variable for directory paths
in_dir=/data/users/hfang/newassembly/assemblies/flye
out_dir=/data/users/hfang/newassembly/evaluations/flye/mummer
ref_file=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa

#load the mummer module
module add UHTS/Analysis/mummer/4.0.0beta1
export PATH=/software/bin:$PATH

#execute NUCmer
nucmer --prefix ${out_dir}/nucmer_flye -b 1000 -c 1000 ${ref_file} ${in_dir}/assembly.fasta

#execute mummerplot
mummerplot -R ${ref_file} -Q ${in_dir}/assembly.fasta --filter -t png --large --fat --layout --prefix ${out_dir}/mummerplot_flye_fat ${out_dir}/nucmer_flye.delta