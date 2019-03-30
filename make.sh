#!/bin/bash

IMAGE=tex:1
NAME=ctex
HOST_FOLDER="$(pwd)/work"
CONTAINER_FOLDER="/test-folder"

docker stop $NAME
docker rm $NAME

docker build -t $IMAGE .
docker run --name $NAME -v $HOST_FOLDER:$CONTAINER_FOLDER -w $CONTAINER_FOLDER $IMAGE $@
docker stop $NAME
docker rm $NAME
