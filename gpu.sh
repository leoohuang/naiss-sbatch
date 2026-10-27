#!/bin/bash

#SBATCH -J python_gpu
#SBATCH -A naiss2026-4-1472-gpu
#SBATCH -p gpu
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --gpus=1
#SBATCH -t 02:00:00
#SBATCH -o job_%j.out

# Load PyTorch environment
module load GPU/buildtool-easybuild
module load GCC/14.3.0
module load OpenMPI/5.0.8
module load PyTorch/2.9.1-CUDA-12.9.1

# Run Python script
mpprun python "$@"
