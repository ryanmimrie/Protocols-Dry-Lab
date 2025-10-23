# BEAST, beagle, tracer Clean Linux Install

## Clean installation
The install process for BEAST and its associated tools on Linux can be messy. The following instructions install BEAST, beagle-cpu and tracer together in the `~/BEAST` directory, and manage pathing.

First install apt-get dependencies:
```bash
sudo apt-get update
sudo apt-get install -y cmake build-essential autoconf automake libtool git pkg-config openjdk-11-jdk
```

Then make the BEAST directory and download BEAST and tracer `.tgz` files (links may be updated to new versions as needed).
```bash
mkdir ~/BEAST
cd ~/BEAST

wget https://github.com/beast-dev/beast-mcmc/releases/download/v10.5.0/BEAST_X_v10.5.0.tgz
tar -xvzf BEAST_X_v10.5.0.tgz
rm BEAST_X_v10.5.0.tgz

mkdir ~/BEAST/Tracer_v1.7.2
cd ~/BEAST/Tracer_v1.7.2
wget https://github.com/beast-dev/tracer/releases/download/v1.7.2/Tracer_v1.7.2.tgz
tar -xvzf Tracer_v1.7.2.tgz
rm Tracer_v1.7.2.tgz
```

Clone and build the beagle-cpu library:
```bash
cd ..
git clone --depth=1 https://github.com/beagle-dev/beagle-lib.git
cd beagle-lib
mkdir build install
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$HOME/BEAST/beagle-lib/install -DBUILD_CUDA=OFF -DBUILD_OPENCL=OFF ..
make -j$(nproc)
make install
```
Then add executables to path:
```bash
export LD_LIBRARY_PATH=$HOME/BEAST/beagle-lib/install/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/BEAST/beagle-lib/install/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH=$HOME/BEAST/BEASTv10.5.0/bin:$PATH
export PATH=$HOME/BEAST/Tracer_v1.7.2:$PATH
source ~/.bashrc
```
