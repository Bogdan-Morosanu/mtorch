#!/bin/bash

if [ $# -ne 1 ]
then
    echo "usage $0 <image-name>"
    exit -1
fi

# spin up and remove a docker container 
echo "sudo nvidia-docker run --rm -it --ipc=host -p 8888:8888 -v ~/Code/mtorch:/notebooks/mtorch $1"
sudo nvidia-docker run --rm -it --ipc=host -p 8888:8888 -v ~/Code/mtorch:/notebooks/mtorch $1


    

	
