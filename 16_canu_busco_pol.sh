#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=02:00:00
#SBATCH --job-name=BUSCO_flye_polished
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,begin,end
#SBATCH --output=/data/users/hfang/newassembly/evaluations/output_busco_canu_pol%j.o
#SBATCH --error=/data/users/hfang/newassembly/evaluations/error_busco_canu_pol%j.e
#SBATCH --partition=pall

# Define paths
WORKDIR=/data/users/hfang/newassembly

# Use BUSCO with container
singularity exec \
--bind $WORKDIR \
/data/courses/assembly-annotation-course/containers2/busco_v5.1.2_cv1.sif \
busco -i ${WORKDIR}/polishing/canu/pilon.fasta -l brassicales_odb10 -o polished_assembly --out_path ${WORKDIR}/evaluations/canu/busco \
-m genome --cpu 4
