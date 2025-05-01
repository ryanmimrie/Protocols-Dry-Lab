# Fresh Ubuntu Setup

![Ubuntu 25.04](https://img.shields.io/badge/Ubuntu-25.04-E95420?logo=ubuntu&logoColor=white&style=flat)

The following are typical steps to set up a new Ubuntu system for bioinformatics, statistical and mathematical modelling.

Current theme of choice is Catppuccin-Frappe.



```bash
# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install useful tools
sudo apt install -y tree htop btop

# Download Anaconda installer to home directory
wget -P ~/ https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh

# Run the installer (will prompt you through setup)
bash ~/Anaconda3-2024.10-1-Linux-x86_64.sh

# Reload shell configuration if Anaconda was added to .bashrc
source ~/.bashrc
```

```bash
conda update -n base -c defaults conda
```
