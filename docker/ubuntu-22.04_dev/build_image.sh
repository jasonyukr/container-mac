#!/bin/bash

IMAGE_NAME=ubuntu-22.04_dev

docker build --platform linux/amd64 -t $IMAGE_NAME --build-arg username=$(whoami) .
