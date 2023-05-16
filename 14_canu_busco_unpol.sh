#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=flye_canu_u
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,begin,end
#SBATCH --output=/data/users/hfang/newassembly/evaluations/canu/busco/output_busco_unpol_%j.o
#SBATCH --error=/data/users/hfang/newassembly/evaluations/canu/busco/error_busco_unpol_%j.e
#SBATCH --partition=pall

#set directory
dir=/data/users/hfang/newassembly

#Use BUSCO with container
singularity exec \
--bind $dir \
/data/courses/assembly-annotation-course/containers2/busco_v5.1.2_cv1.sif \
busco -i ${dir}/assemblies/canu/arabidopsis.contigs.fasta -l brassicales_odb10 -o unpolished_assembly \
--out_path ${dir}/evaluations/canu/busco -m genome --cpu 4 
