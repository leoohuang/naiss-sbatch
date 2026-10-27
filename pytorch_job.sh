#!/bin/bash
#SBATCH --job-name=pytorch_test
#SBATCH --account=naiss2026-4-1472-gpu
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gpus=1
#SBATCH --time=00:10:00
#SBATCH --output=pytorch_%j.out
#SBATCH --error=pytorch_%j.err

set -e

# Load PyTorch and its dependencies
module load GPU/buildtool-easybuild/5.2.1-hpca3ef7d197
module load GCC/14.3.0
module load OpenMPI/5.0.8
module load PyTorch/2.9.1-CUDA-12.9.1

echo "Starting PyTorch job..."
echo "Job ID: $SLURM_JOB_ID"

srun python gpu_test.py
