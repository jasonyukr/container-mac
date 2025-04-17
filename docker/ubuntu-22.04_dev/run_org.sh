#!/bin/bash

export WHOAMI=`whoami`

docker run -it -e DISPLAY --net=host --ipc=host --pid=host --rm \
    -e TERM -e COLORTERM \
    --device /dev/fuse --cap-add SYS_ADMIN \
    -h jellyfish     `# Ubuntu 22.04 LTS Jammy Jellyfish` \
    --user $(id -u)  `# login as current user` \
    -w $(pwd)        `# start the shell in the same directory` \
    `# bash and zsh` \
    -v /home/${WHOAMI}/.bashrc:/home/${WHOAMI}/.bashrc \
    -v /home/${WHOAMI}/.fzf.bash:/home/${WHOAMI}/.fzf.bash \
    -v /home/${WHOAMI}/.zshrc:/home/${WHOAMI}/.zshrc \
    -v /home/${WHOAMI}/.zshenv:/home/${WHOAMI}/.zshenv \
    -v /home/${WHOAMI}/.zshrc_fzf.sh:/home/${WHOAMI}/.zshrc_fzf.sh \
    -v /home/${WHOAMI}/.fzf.zsh:/home/${WHOAMI}/.fzf.zsh \
    `# config and data` \
    -v /home/${WHOAMI}/.gitconfig:/home/${WHOAMI}/.gitconfig \
    -v /home/${WHOAMI}/.ssh:/home/${WHOAMI}/.ssh \
    -v /home/${WHOAMI}/.vim:/home/${WHOAMI}/.vim \
    -v /home/${WHOAMI}/.vimrc:/home/${WHOAMI}/.vimrc \
    -v /home/${WHOAMI}/.config/nvim:/home/${WHOAMI}/.config/nvim \
    -v /home/${WHOAMI}/.config/neofetch/config.conf:/home/${WHOAMI}/.config/neofetch/config.conf \
    -v /home/${WHOAMI}/.local/share/nvim:/home/${WHOAMI}/.local/share/nvim \
    -v /home/${WHOAMI}/.local/state/nvim:/home/${WHOAMI}/.local/state/nvim \
    -v /home/${WHOAMI}/.vim_mru_files:/home/${WHOAMI}/.vim_mru_files \
    -v /home/${WHOAMI}/.z:/home/${WHOAMI}/.z:ro   `# set RO. This is not to lose data by limited docker view` \
    -v /home/${WHOAMI}/.zsh:/home/${WHOAMI}/.zsh  `# .zsh/ contains .zsh_history file` \
    -v /home/${WHOAMI}/dotfiles:/home/${WHOAMI}/dotfiles \
    `# apps and workspace` \
    -v /home/${WHOAMI}/.fzf:/home/${WHOAMI}/.fzf \
    -v /home/${WHOAMI}/Applications:/home/${WHOAMI}/Applications \
    -v /home/${WHOAMI}/backup:/home/${WHOAMI}/backup \
    -v /home/${WHOAMI}/CPU:/home/${WHOAMI}/CPU \
    -v /home/${WHOAMI}/Desktop:/home/${WHOAMI}/Desktop \
    -v /home/${WHOAMI}/docker:/home/${WHOAMI}/docker \
    -v /home/${WHOAMI}/opengrok_docker:/home/${WHOAMI}/opengrok_docker \
    -v /home/${WHOAMI}/Documents:/home/${WHOAMI}/Documents \
    -v /home/${WHOAMI}/dotfiles:/home/${WHOAMI}/dotfiles \
    -v /home/${WHOAMI}/Downloads:/home/${WHOAMI}/Downloads \
    -v /home/${WHOAMI}/github:/home/${WHOAMI}/github \
    -v /home/${WHOAMI}/graalvm:/home/${WHOAMI}/graalvm \
    -v /home/${WHOAMI}/iso:/home/${WHOAMI}/iso \
    -v /home/${WHOAMI}/JIRA:/home/${WHOAMI}/JIRA \
    -v /home/${WHOAMI}/Music:/home/${WHOAMI}/Music \
    -v /home/${WHOAMI}/Pictures:/home/${WHOAMI}/Pictures \
    -v /home/${WHOAMI}/project:/home/${WHOAMI}/project \
    -v /home/${WHOAMI}/Public:/home/${WHOAMI}/Public \
    -v /home/${WHOAMI}/Templates:/home/${WHOAMI}/Templates \
    -v /home/${WHOAMI}/test:/home/${WHOAMI}/test \
    -v /home/${WHOAMI}/tmp:/home/${WHOAMI}/tmp \
    -v /home/${WHOAMI}/tools:/home/${WHOAMI}/tools \
    -v /home/${WHOAMI}/Videos:/home/${WHOAMI}/Videos \
    -v /home/${WHOAMI}/work:/home/${WHOAMI}/work \
    -v /mnt:/mnt \
    -v /java:/java \
    -v /opt:/opt \
    -v /ws:/ws \
    `# rust (share everything with host) ` \
    -v /home/${WHOAMI}/.rustup:/home/${WHOAMI}/.rustup \
    -v /home/${WHOAMI}/.cargo:/home/${WHOAMI}/.cargo \
    `# go-lang (share everything with host) ` \
    -v /home/${WHOAMI}/go:/home/${WHOAMI}/go \
    `# share /tmp as well` \
    -v /tmp:/tmp \
    \
    ubuntu-22.04_dev /usr/bin/zsh
