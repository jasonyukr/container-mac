#!/bin/bash

export WHOAMI=`whoami`

docker run --platform linux/amd64 -it -e DISPLAY --net=host --ipc=host --pid=host --rm \
    -e TERM -e COLORTERM \
    --device /dev/fuse --cap-add SYS_ADMIN \
    -h jellyfish     `# Ubuntu 22.04 LTS Jammy Jellyfish` \
    --user 1000  `# login as current user` \
    -w $(pwd)        `# start the shell in the same directory` \
    `# bash and zsh` \
    ubuntu-22.04_dev /usr/bin/zsh
