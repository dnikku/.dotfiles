#!/bin/bash

# build and extract picolisp binaries for archlinux
# [picolisp](https://picolisp.com/wiki/?home)

LOCAL_DIR=./pil21
IMAGE_TAG=archlinux-pil21
MYGROUPID=$(id -g)

docker build . -t $IMAGE_TAG

rm -rf $LOCAL_DIR
mkdir -p $LOCAL_DIR
LOCAL_DIR=$(realpath $LOCAL_DIR)

docker run --rm -it -v "$LOCAL_DIR:/pil21" $IMAGE_TAG /bin/bash -c \
  "cp -R /home/pil21/* /pil21; chown -R $UID:$MYGROUPID /pil21"


# remove all containers
# docker ps -a --format "{{ .ID }}" | xargs docker rm


