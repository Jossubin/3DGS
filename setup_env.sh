#!/bin/bash

set -e

echo "🔧 Updating and installing system packages..."
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  libglib2.0-0 \
  libsm6 \
  libxrender1 \
  libxext6 \
  libgl1-mesa-glx \
  libopencv-dev \
  libomp-dev \
  ffmpeg \
  wget \
  git \
  python3-pip \
  python3-dev

echo "⬆️ Upgrading pip for system Python..."
pip install --upgrade pip==22.3.1

echo "🔥 Installing PyTorch (CUDA 11.6)..."
pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116

echo "📚 Installing Python packages..."
pip install tqdm plyfile opencv-python joblib

git cone https://github.com/graphdeco-inria/gaussian-splatting.git

echo "📁 Installing submodules from local folders..."
pip install ./submodules/diff-gaussian-rasterization
pip install ./submodules/simple-knn
pip install ./submodules/fused-ssim

echo "✅ Environment setup complete!"
