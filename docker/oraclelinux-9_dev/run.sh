#!/bin/bash

export WHOAMI=`whoami`
export _USERS_=/Users/$WHOAMI
export _HOME_=/home/$WHOAMI

docker run --platform linux/amd64 -it -e DISPLAY --net=host --ipc=host --pid=host --rm \
    -e TERM -e COLORTERM \
    --device /dev/fuse --cap-add SYS_ADMIN \
    -h oraclelinux9  `# oraclelinux9 ` \
    --user $(id -u)  `# login as current user` \
    -v $_USERS_/github:$_HOME_/github \
    -v $_USERS_/container:$_HOME_/container \
    -v $_USERS_/tools:$_HOME_/tools \
    -v $_USERS_/container/mount_point/opt:/opt \
    -v $_USERS_/.bashrc:$_HOME_/.bashrc \
    -v $_USERS_/container/mount_point/home/jinhyu/.fzf:$_HOME_/.fzf \
    -v $_USERS_/.zshenv:$_HOME_/.zshenv \
    -v $_USERS_/.zshrc:$_HOME_/.zshrc \
    -v $_USERS_/.fzf.bash:$_HOME_/.fzf.bash \
    -v $_USERS_/.fzf.zsh:$_HOME_/.fzf.zsh \
    -v $_USERS_/.zshrc_fzf.sh:$_HOME_/.zshrc_fzf.sh \
    -v $_USERS_/.getfiletype.sh:$_HOME_/.getfiletype.sh \
    oraclelinux-9_dev /usr/bin/zsh
