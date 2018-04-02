#!/bin/bash

if [ $# -ne 1 ]
then
    echo "usage $0 <container-name>"
    exit -1
fi


CLEAN_NAME=$(echo $1 | sed 's/[^a-zA-Z0-9]/_/g')
SEARCH=$(sudo docker container ls -a | grep $CLEAN_NAME)

echo "search : $SEARCH"

if [[ $SEARCH ]]
then # found the container, let's just start it
    echo "sudo nvidia-docker start $CLEAN_NAME"
    sudo nvidia-docker start --attach $CLEAN_NAME

else # not found, spin up a new one

    echo "sudo nvidia-docker run -it --ipc=host -p 8888:8888 -v ~/Code/mtorch:/notebooks/mtorch $CLEAN_NAME"
    sudo nvidia-docker run -it --ipc=host -p 8888:8888 -v ~/Code/mtorch:/notebooks/mtorch --name $CLEAN_NAME $1

fi
    

	
