import torch
import socket
import time

print("=== NAISS PyTorch GPU Test ===")
print("Hostname:", socket.gethostname())
print("PyTorch version:", torch.__version__)
print("CUDA available:", torch.cuda.is_available())

assert torch.cuda.is_available(), "CUDA GPU not available!"

device = torch.device("cuda")
print("GPU:", torch.cuda.get_device_name(0))

# Create two random matrices on the GPU
a = torch.rand(2000, 2000, device=device)
b = torch.rand(2000, 2000, device=device)

# Perform GPU matrix multiplication
torch.cuda.synchronize()
start = time.perf_counter()

c = a @ b

torch.cuda.synchronize()
elapsed = time.perf_counter() - start

print("Result shape:", c.shape)
print("Result device:", c.device)
print(f"GPU computation time: {elapsed:.4f} seconds")
print("GPU computation successful!")
