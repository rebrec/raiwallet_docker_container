#!/bin/sh

. ./config.sh

docker run -d \
           -e DISPLAY=$DISPLAY \
           -e USER=$(id -u) \
           -e GROUP=$(id -g) \
           -v /tmp/.X11-unix/:/tmp/.X11-unix \
           -v $HOME/$WALLET_FOLDER_NAME:/root/$WALLET_FOLDER_NAME \
           -ti --rm $IMAGE_NAME $DOCKER_RUN_FILE

