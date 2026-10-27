# Job Script Examples

以下是 NAISS Arrhenius 集群提供的 Slurm 批处理脚本示例，分别适用于 CPU 和 GPU 计算任务。

## 1. CPU Batch Job Script

用于在 CPU 分区提交批处理任务。

```bash
#!/bin/bash
#SBATCH -n 512
#SBATCH -c 1
#SBATCH -t 10                  # Requested walltime
#SBATCH -A naiss<project_number>-cpu
#SBATCH -p cpu

# Just an example. Could be replaced with a
# "module load <relevant_module>" when such are available.
export PATH=/example/install/prefix/libexec/osu-micro-benchmarks/mpi/collective:$PATH

mpprun osu_allreduce
```

## 2. GPU Batch Job Script

用于在 GPU 分区提交批处理任务。

```bash
#!/bin/bash
#SBATCH -n 8
#SBATCH -c 72
#SBATCH --gpus 8
#SBATCH -t 10                  # Requested walltime
#SBATCH -A naiss<project_number>-gpu
#SBATCH -p gpu

# Just an example. Could be replaced with a
# "module load <relevant_module>" when such are available.
export PATH=/example/install/prefix/libexec/osu-micro-benchmarks/mpi/collective:$PATH

mpprun osu_allreduce
```

## 3. Slurm 参数说明

| 参数 | 含义 |
|---|---|
| `#!/bin/bash` | 指定 Bash 作为脚本解释器 |
| `-n` | 任务数量（Number of Tasks） |
| `-c` | 每个任务分配的 CPU 核心数（CPUs per Task） |
| `--gpus` | 申请的 GPU 数量 |
| `-t` | 最长运行时间（Walltime），此处 `10` 表示 10 分钟 |
| `-A` | NAISS 项目账户（Project Account） |
| `-p` | 计算分区（Partition） |
| `export PATH` | 将指定软件目录加入可执行文件搜索路径 |
| `mpprun` | Arrhenius 推荐的并行程序启动工具 |

## 4. 提交任务

将脚本保存为 `.sh` 文件，例如：

- `cpu_job.sh`
- `gpu_job.sh`

然后使用 `sbatch` 提交：

```bash
sbatch cpu_job.sh
```

或者：

```bash
sbatch gpu_job.sh
```

查看任务状态：

```bash
squeue -u $USER
```

查看已结束任务的信息：

```bash
sacct -j <job_id>
```

**注意：** 以上是 NAISS 官方的示例配置，申请的 CPU/GPU 数量和项目账户需要根据实际任务调整。示例中的 `export PATH` 也需要替换为真实的软件安装路径，或者使用相应的 `module load` 命令。

**官方文档：** [NAISS Arrhenius — Job Scripts](https://user.naiss.se/arrhenius_hpc/job_management/scripts/)