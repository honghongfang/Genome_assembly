#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=merqury_flye_unpol
#SBATCH --mail-user=honghong.fang@students.unibe.ch
#SBATCH --mail-type=fail,begin,end
#SBATCH --output=/data/users/hfang/newassembly/evaluations/output_flye_merqury_unpol_%j.o
#SBATCH --error=/data/users/hfang/newassembly/evaluations/error_flye_merqury_unpol_%j.e
#SBATCH --partition=pall

# Define paths
WORKDIR=/data/users/hfang/newassembly
DATADIR=/data/courses/assembly-annotation-course
read_dir=${WORKDIR}/participant_1/Illumina
meryl_dir=${WORKDIR}/evaluations/meryl

# Go to working directory for meryl
cd ${meryl_dir}/

# Count and combine the kmers from the forward and backward reads
singularity exec \
--bind $WORKDIR \
--bind $DATADIR \
/software/singularity/containers/Merqury-1.3-1.ubuntu20.sif \
meryl union-sum \
output union.meryl \
[count k=21 ${read_dir}/ERR3624575_1.fastq.gz output read1.meryl] \
[count k=21 ${read_dir}/ERR3624575_2.fastq.gz output read2.meryl]

# Go to working directory for merqury
cd ${WORKDIR}/evaluations/flye/merqury

# Run container with merqury
singularity exec \
--bind $WORKDIR \
--bind $DATADIR \
/software/singularity/containers/Merqury-1.3-1.ubuntu20.sif \
merqury.sh \
${meryl_dir}/union.meryl \
${WORKDIR}/assemblies/flye/assembly.fasta \
flye_unpol
