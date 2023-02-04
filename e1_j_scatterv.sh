#!/bin/bash
##SBATCH -q express
#SBATCH -J JuliaBenchMark
#SBATCH -A hpc-prf-mpibj
#SBATCH -p normal
#SBATCH -N 4                       ## [NUMBER_OF_NODE]
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=64      ## [NUMBER_OF_MPI_RANKS_PER_NODE]
#SBATCH --exclusive
#SBATCH -t 20:40:00

module reset
module load lang                   # loading the gateway module
module load JuliaHPC               # loading the latest JuliaHPC

srun -n 256 --exclusive julia --project e1_j_scatterv.jl
srun -n 256 --exclusive /scratch/hpc-prf-mpibj/com/osu-micro-benchmarks-7.0.1/c/mpi/collective/osu_scatterv -m 2097152 -i 262144 -f
