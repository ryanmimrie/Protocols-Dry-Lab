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

# Install R and RStudio
sudo apt install r-base r-base-dev

wget -P ~/ https://download1.rstudio.org/electron/jammy/amd64/rstudio-2025.05.1-513-amd64.deb
sudo apt install -y ./rstudio-2025.05.1-513-amd64.deb

# Open R
sudo R
```

```R
install.packages('devtools')
install.packages('tidyverse')

q()
```

## Theme (Catppuccin-Frappe)
- `btop` [Link](https://github.com/catppuccin/btop/tree/main)
- `RStudio` [Link](https://github.com/catppuccin/rstudio)
- `Spyder` [Link](https://github.com/catppuccin/spyder)

#### Gnome Terminal
Online example no longer works. Manual steps:

```bash 
nano catppuccin-frappe.conf
```
Copy in the following and save:
```
[/]
background-color='rgb(48,52,70)'
bold-color-same-as-fg=true
cursor-background-color='rgb(198,208,245)'
cursor-colors-set=true
cursor-foreground-color='rgb(48,52,70)'
font='Monospace 10'
foreground-color='rgb(198,208,245)'
highlight-background-color='rgb(198,208,245)'
highlight-colors-set=true
highlight-foreground-color='rgb(98,104,128)'
palette=['rgb(81,87,109)', 'rgb(231,130,132)', 'rgb(166,209,137)', 'rgb(229,200,144)', 'rgb(140,170,238)', 'rgb(244,184,228)', 'rgb(129,200,190)', 'rgb(165,173,206)', 'rgb(98,104,128)', 'rgb(230,113,114)', 'rgb(142,199,114)', 'rgb(217,186,115)', 'rgb(123,158,240)', 'rgb(242,164,219)', 'rgb(90,191,181)', 'rgb(181,191,226)']
use-system-font=false
use-theme-colors=false
visible-name='Catppuccin-Frappe'
```
Find your terminal theme profile number:
```bash
gsettings get org.gnome.Terminal.ProfilesList list
```
Then load the theme settings into it:
```bash
dconf load /org/gnome/terminal/legacy/profiles:/:PROFILE_NUMBER/ < catppuccin-frappe.conf
```
