# BRAKER3

![Linux](https://img.shields.io/badge/Linux-grey?logo=linux)

The following installs BRAKER3 using apptainer (i.e., singularity) on a unix-based system.

### Install system dependencies
```bash
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

### Install go (required for building Apptainer)
```bash
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### Download and build Apptainer (with SUID)
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

### Fix permissions
```bash
sudo chmod 4755 /usr/local/libexec/apptainer/bin/starter
ls -l /usr/local/libexec/apptainer/bin/starter
# Should show -rwsr-xr-x
```

### Pull the BRAKER3 Docker image as a Singularity SIF
```bash
apptainer build braker3.sif docker://teambraker/braker3
```

### Test the BRAKER3 container
```bash
apptainer exec --no-userns braker3.sif braker.pl --help
```




