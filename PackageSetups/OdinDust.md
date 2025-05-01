# Odin and Odin Dust (V1)

![Windows](https://img.shields.io/badge/Windows-blue?logo=microsoftwindows)
![macOS](https://img.shields.io/badge/macOS-black?logo=apple)
![Linux](https://img.shields.io/badge/Linux-grey?logo=linux)

The following installs the necessary R packages to run Odin models with Odin Dust in a separate conda environment called `Odin`.

```bash
# In a unix terminal, macOS terminal, or Anaconda prompt (windows)
conda create -n Odin r-essentials r-base
conda activate Odin

R
```

```R
install.packages('devtools')

devtools::install_github('mrc-ide/odin')
devtools::install_github('mrc-ide/dust')
devtools::install_github('mrc-ide/odin.dust')

install.packages('tidyverse')
install.packages('socialmixr')
q()
```
