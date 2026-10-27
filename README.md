Job script examples¶
CPU Batch Job Script¶
#!/bin/bash
#SBATCH -n 512
#SBATCH -c 1
#SBATCH -t 10 # Requested walltime
#SBATCH -A naiss<project_number>-cpu
#SBATCH -p cpu

# Just an example. Could be replaced with a "module load <relevant_module>" when such are available.
export PATH=/example/install/prefix/libexec/osu-micro-benchmarks/mpi/collective:$PATH
mpprun osu_allreduce
GPU Batch Job Script¶
#!/bin/bash
#SBATCH -n 8
#SBATCH -c 72
#SBATCH --gpus 8
#SBATCH -t 10 # Requested walltime
#SBATCH -A naiss<project_number>-gpu
#SBATCH -p gpu

# Just an example. Could be replaced with a "module load <relevant_module>" when such are available.
export PATH=/example/install/prefix/libexec/osu-micro-benchmarks/mpi/collective:$PATH
mpprun osu_allreduce