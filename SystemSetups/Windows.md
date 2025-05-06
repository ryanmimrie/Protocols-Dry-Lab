# Fresh Windows + WSL2 Setup

![Windows 11](https://img.shields.io/badge/Windows-11-0078D6?logo=windows&logoColor=white&style=flat)
![WSL2](https://img.shields.io/badge/WSL2-Enabled-green?logo=linux&logoColor=white&style=flat)

The following steps set up a **Windows system** with **Ubuntu (via WSL2)** for bioinformatics, statistical and mathematical modeling.

---

## 🔧 Step 1: Install WSL2 with Ubuntu

Open **PowerShell as Administrator** and run:

```powershell
wsl --install
```

> This installs WSL2 with Ubuntu (default version). Reboot when prompted.

Once rebooted, launch **Ubuntu** from the Start Menu and create your Linux username and password.

---

## ⚙️ Step 2: Basic Ubuntu Setup in WSL2

In the Ubuntu terminal (within WSL2):

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
```

---

## 📦 Step 3: Install R Packages

```bash
R
```

```r
install.packages('devtools')
install.packages('tidyverse')
install.packages('MCMCglmm')
install.packages('patchwork')
q()
```

---

## 🧪 Step 4: Install Bioinformatics Tools

```bash
# Create a new Conda environment for bioinformatics
mamba create -n bioinf python=3.11 -y
conda activate bioinf

# Install common bioinformatics tools
mamba install -c bioconda -c conda-forge bwa samtools spades kraken2 fastqc multiqc seqkit -y
```

---

## 🪟 Step 5: Recommended Windows Tools

- [Windows Terminal](https://aka.ms/terminal) – modern terminal for WSL and PowerShell.
- [Visual Studio Code](https://code.visualstudio.com/) – install the *Remote - WSL* extension for full Linux file access.
- [RStudio Desktop](https://posit.co/download/rstudio-desktop/) – if you prefer using R natively in Windows.
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) – optional, for containerized workflows (ensure WSL2 backend is enabled).

---

## 🧠 Notes

- Store large data and reference databases **inside the WSL filesystem** (e.g., `/home/yourname/data/`) rather than on `/mnt/c/` to avoid slow I/O.
- Access WSL files from Windows via: `\\wsl$\Ubuntu\home\yourname\`
- To open a Linux shell quickly: use the **Ubuntu app** or a new tab in **Windows Terminal**.

---
