# Docker images for GPGPUSim

This repository contains two docker images for [GPGPUSim](https://github.com/gpgpu-sim/gpgpu-sim_distribution):

  * **18.04**: The 18.04 image contains Ubuntu 18.04, CUDA 9.1, and the latest version of GPGPUSim at the time of writing.

  * **12.04**: The 12.04 image contains Ubuntu 12.04, CUDA 4.1, and a version of GPGPUSim that works with this combination. This image supports running PTXPlus bytecode, a closer-to-machine-code representation than PTX, which is not supported by recent versions of CUDA and GPGPUSim.

## Usage instructions

The following instructions are known to work on Ubuntu 20.04, assuming docker is installed.

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### 18.04

```sh
make shell   # This will take a while the first time
cd example
nvcc --cudart shared saxpy.cu -o saxpy
cp /home/dev-user/gpgpu-sim_distribution/configs/tested-cfgs/SM2_GTX480/*
./saxpy
```

### 12.04

```sh
make shell-1204   # This will take a while the first time
cd example
nvcc saxpy.cu -o saxpy
cp /home/dev-user/gpgpu-sim_distribution/configs/GTX480/* .
./saxpy
```
