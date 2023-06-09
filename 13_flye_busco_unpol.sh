#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=flye_busco_u
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,begin,end
#SBATCH --output=/data/users/hfang/newassembly/evaluations/flye/busco/output_busco_unpol_%j.o
#SBATCH --error=/data/users/hfang/newassembly/evaluations/flye/busco/error_busco_unpol_%j.e
#SBATCH --partition=pall

#set directory
dir=/data/users/hfang/newassembly

#Use BUSCO with container
singularity exec \
--bind $dir \
/data/courses/assembly-annotation-course/containers2/busco_v5.1.2_cv1.sif \
busco -i ${dir}/assemblies/flye/assembly.fasta -l brassicales_odb10 -o unpolished_assembly \
--out_path ${dir}/evaluations/flye/busco -m genome --cpu 4 

