#!/bin/bash

# read architecture from $HOME/.arch
read -r Arch<~/.arch
echo "running on $Arch"

# package up the results to be used in the next phase
mkdir -p ~/armnn/lib
cp ~/armnn-devenv/pkg/install/lib/libprotobuf.so.15 ~/armnn/lib
cp ~/armnn-devenv/armnn/build/libarmnnTfParser.so ~/armnn/lib
cp ~/armnn-devenv/armnn/build/libarmnn.so ~/armnn/lib
cp -r ~/armnn-devenv/armnn/include/ ~/armnn
tar cvfz armnn-$Arch.tar.gz ./armnn
cp armnn-$Arch.tar.gz ~/rel-$Arch

echo "package is saved at armnn-$Arch.tar.gz"

