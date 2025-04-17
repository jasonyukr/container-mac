#!/bin/bash

export WHOAMI=`whoami`
export _USERS_=/Users/$WHOAMI
export _HOME_=/home/$WHOAMI

docker run --platform linux/amd64 -it -e DISPLAY --net=host --ipc=host --pid=host --rm \
    -e TERM -e COLORTERM \
    --device /dev/fuse --cap-add SYS_ADMIN \
    -h jammy     `# Ubuntu 22.04 LTS Jammy Jellyfish` \
    --user $(id -u)  `# login as current user` \
    `# bash and zsh` \
    -v $_USERS_/.bashrc:$_HOME_/.bashrc \
    -v $_USERS_/.zshrc:$_HOME_/.zshrc \
    -v $_USERS_/github:$_HOME_/github \
    -v $_USERS_/container:$_HOME_/container \
    ubuntu-22.04_dev /usr/bin/zsh
