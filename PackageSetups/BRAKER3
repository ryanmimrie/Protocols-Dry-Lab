# BRAKER3

![Linux](https://img.shields.io/badge/Linux-grey?logo=linux)

The following installs BRAKER3 using apptainer (i.e., singularity) on a unix-based system.

In a unix terminal run the following:

```bash
# In a unix terminal
sudo apt update && sudo apt install -y \
    build-essential \
    uuid-dev \
    libgpgme-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup \
    fuse2fs \
    gocryptfs
```

```bash
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```

```bash
export VERSION=1.2.4
wget https://github.com/apptainer/apptainer/releases/download/v${VERSION}/apptainer-${VERSION}.tar.gz
tar -xzf apptainer-${VERSION}.tar.gz
cd apptainer-${VERSION}
```

```bash
sudo env "PATH=$PATH" ./mconfig
sudo make -C builddir
sudo make -C builddir install
```

```bash
sudo chmod 4755 /usr/local/libexec/apptainer/bin/starter
ls -l /usr/local/libexec/apptainer/bin/starter
# Should show -rwsr-xr-x
```

```bash
apptainer build braker3.sif docker://teambraker/braker3
```






