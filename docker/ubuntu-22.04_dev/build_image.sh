#!/bin/sh
docker build --platform linux/amd64 -t ubuntu-22.04_dev --build-arg username=$(whoami) .
