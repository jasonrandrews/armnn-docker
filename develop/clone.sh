#!/bin/bash

# set LD_LIBRARY_PATH for Arm NN
if grep -q "armnn" $HOME/.bashrc; then 
    echo "LD_LIBRARY_PATH already set in .bashrc" 
else 
    echo "export LD_LIBRARY_PATH=/home/ubuntu/armnn/lib" >> $HOME/.bashrc
fi

# clone source example
git clone https://github.com/jasonrandrews/mnist-demo.git

cd mnist-demo ; make
