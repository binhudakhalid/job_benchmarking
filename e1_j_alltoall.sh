#!/bin/bash
##SBATCH -q express
#SBATCH -J JuliaBenchMark
#SBATCH -A hpc-prf-mpibj
#SBATCH -p normal
#SBATCH -N 4                       ## [NUMBER_OF_NODE]
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=32      ## [NUMBER_OF_MPI_RANKS_PER_NODE]
#SBATCH --exclusive
#SBATCH -t 40:40:00

module reset
module load lang                   # loading the gateway module
module load JuliaHPC               # loading the latest JuliaHPC

srun -n 128 --exclusive julia --project e1_j_alltoall.jl
srun -n 128 --exclusive /scratch/hpc-prf-mpibj/com/osu-micro-benchmarks-7.0.1/c/mpi/collective/osu_alltoall -m 2097152 -i 262144 -f
