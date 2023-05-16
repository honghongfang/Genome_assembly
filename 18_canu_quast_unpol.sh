#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=01:00:00
#SBATCH --job-name=canu_quast_unpol_noref
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,begin,end
#SBATCH --output=/data/users/hfang/newassembly/evaluations/canu/quast/output_canu_quast_unpol_noref_%j.o
#SBATCH --error=/data/users/hfang/newassembly/evaluations/canu/quast/error_canu_quast_unpol_noref_%j.e
#SBATCH --partition=pall

# Define paths
dir=/data/users/hfang/newassembly

# Use QUAST with container once without and once with reference 
# Without reference:
singularity exec \
--bind $dir \
/data/courses/assembly-annotation-course/containers/quast_5.1.0rc1.sif \
quast.py ${dir}/assemblies/canu/arabidopsis.contigs.fasta --eukaryote --large \
--est-ref-size 135000000 --threads 4 --labels canu_assembly_unpol \
-o ${dir}/evaluations/canu/quast
