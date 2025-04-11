# 🟡 3DGS (Gaussian Splatting) - Evaluation Guide

This repository is intended for **Docker users**.  
Below is the setup process to prepare the environment for evaluation.

Confirmed to work with
`docker pull nvidia/cuda:11.6.1-cudnn8-runtime-ubuntu20.04`
✅ python3.8

---

## 🚀 Environment Setup

Run the following commands to set up the required environment dependencies.
```bash
# git clone
git clone https://github.com/SJpark02/3dgs-eval.git
git clone https://github.com/graphdeco-inria/gaussian-splatting --recursive

# Permission
chmod +x setup_env.sh

# Run
./setup_env.sh
```

</br>

## Evaluation
By default, the trained models use all available images in the dataset. To train them while withholding a test set for evaluation, use the ```--eval``` flag. This way, you can render training/test sets and produce error metrics as follows:
```shell
python train.py -s <path to COLMAP or NeRF Synthetic dataset> -m <model path> --eval # Train with train/test split
# e.g. python train.py -s ./workspace/dataset/truck -m /workspace/output/truck --eval

python render.py -m <path to trained model> # Generate renderings

python metrics.py -m <path to trained model> # Compute error metrics on renderings
```
