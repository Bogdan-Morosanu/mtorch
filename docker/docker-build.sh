#!/bin/bash

# grab pytorch and build a local version of pytorch docker
mkdir temp
cd temp
git clone https://github.com/pytorch/pytorch
cd pytorch
sudo docker build . -f docker/pytorch/Dockerfile -t local-pytorch

# cleanup
cd ..
cd ..
rm -rf temp

# build mtorch docker, based on the pytorch local version
sudo docker build . -f Dockerfile -t mtorch
