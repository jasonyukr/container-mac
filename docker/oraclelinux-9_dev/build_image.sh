#!/bin/bash

IMAGE_NAME=oraclelinux-9_dev

docker build --platform linux/amd64 -t $IMAGE_NAME --build-arg username=$(whoami) .
