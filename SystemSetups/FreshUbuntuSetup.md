# Fresh Ubuntu Setup

![Ubuntu 25.04](https://img.shields.io/badge/Ubuntu-25.04-E95420?logo=ubuntu&logoColor=white&style=flat)

The following are typical steps to set up a new Ubuntu system for bioinformatics, statistical and mathematical modelling.

## Basic Setup

```bash
# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install useful tools
sudo apt install -y tree htop btop r-base

# Download Anaconda installer to home directory
wget -P ~/ https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh

# Run the installer (will prompt you through setup)
bash ~/Anaconda3-2024.10-1-Linux-x86_64.sh

# Reload shell configuration if Anaconda was added to .bashrc
source ~/.bashrc

# Update Conda to current version
conda update -n base -c defaults conda

# Install RStudio
wget -P ~/ https://download1.rstudio.org/electron/focal/amd64/rstudio-2024.04.0-735-amd64.deb
sudo apt install -y ./rstudio-2024.04.0-735-amd64.deb

# Open R
R
```

```R
install.packages('devtools')
install.packages('tidyverse')
install.packages('MCMCglmm')
install.packages('patchwork')

q()
```
