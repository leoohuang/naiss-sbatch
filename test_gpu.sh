#!/bin/bash
#SBATCH --job-name=hello_naiss
#SBATCH --account=naiss2026-4-1472-gpu
#SBATCH --partition=gpu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus=1
#SBATCH --time=00:10:00
#SBATCH --output=hello_%j.out

echo "Hello from NAISS!"
echo "Running on: $(hostname)"
echo "Job ID: $SLURM_JOB_ID"
echo "Date: $(date)"

srun nvidia-smi
