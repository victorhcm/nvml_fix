#!/bin/bash
NVIDIA_GDK_SUM=1e32e58f69fe29ee67b845233e7aa9347f37994463252bccbc8bfc8a7104ab5a && \
    wget -O gdk.run -q http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_352_39_gdk_linux.run && \
    echo "$NVIDIA_GDK_SUM  gdk.run" | sha256sum -c --strict -

chmod +x gdk.run 
sudo ./gdk.run 
# rm gdk.run
