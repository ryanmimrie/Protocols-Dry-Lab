# Fresh Windows + WSL2 Setup

![Windows 11](https://img.shields.io/badge/Windows-11-0078D6?logo=windows&logoColor=white&style=flat)
![WSL2](https://img.shields.io/badge/WSL2-Enabled-green?logo=linux&logoColor=white&style=flat)

The following steps set up a **Windows system** with **Ubuntu (via WSL2)** for bioinformatics, statistical and mathematical modeling.

---

## Basic Setup

Open **PowerShell as Administrator** and run:

```powershell
wsl --install
```

> This installs WSL2 with Ubuntu (default version). Reboot when prompted.

Once rebooted, launch **Ubuntu** from the Start Menu and create your Linux username and password.

In the Ubuntu terminal:

```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install useful CLI tools
sudo apt install -y tree htop btop curl wget unzip build-essential

# Install R base
sudo apt install -y r-base

# Install Conda (Mambaforge is lighter and faster than Anaconda)
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -P ~/
bash ~/Mambaforge-Linux-x86_64.sh

# Reload shell if needed
source ~/.bashrc

# Update Conda (via mamba)
mamba update -n base mamba -y

# Open R
R
```

```r
install.packages('devtools')
install.packages('tidyverse')
install.packages('MCMCglmm')
install.packages('patchwork')
q()
```

