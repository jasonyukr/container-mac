#!/bin/bash

sudo echo -n

HOST=oraclelinux9
IMG=localhost/oraclelinux-9_dev
CONTAINER_DIR=${HOME}/container/podman/oraclelinux-9_dev

#######################################
SELINUX=`getenforce`
if [ $SELINUX = "Enforcing" ]; then
  echo "Set SELinux permissive !!!!"
  sudo setenforce 0
elif [ $SELINUX = "Permissive" ]; then
  echo "SELinux is permissive."
elif [ $SELINUX = "Disabled" ]; then
  echo "SELinux is disabled."
else
  echo "Unexpected SELinux state."
  exit
fi
#######################################
# copy zoxide files before running the container
mkdir ${CONTAINER_DIR}/zoxide 2> /dev/null
cp -f ${HOME}/.local/share/zoxide/* ${CONTAINER_DIR}/zoxide/. 2> /dev/null
#######################################

sudo podman run -it --rm \
  `##### host-like config ` \
  --net=host --ipc=host --pid=host \
  --device /dev/fuse \
  --cap-add=SYS_ADMIN --cap-add=CAP_AUDIT_WRITE \
  -e DISPLAY -e TERM -e COLORTERM \
  -e TZ=Asia/Seoul \
  --user $(id -u) -v /etc/shadow:/etc/shadow:ro \
  -h $HOST \
  `` \
  `##### zsh and bash ` \
  -v ${HOME}/.bash_profile:${HOME}/.bash_profile \
  -v ${HOME}/.bashrc:${HOME}/.bashrc \
  -v ${HOME}/.my_bash_history:${HOME}/.my_bash_history \
  -v ${HOME}/.zshenv:${HOME}/.zshenv \
  -v ${HOME}/.zshrc:${HOME}/.zshrc \
  -v ${HOME}/.zsh:${HOME}/.zsh \
  `` \
  `##### fzf ` \
  -v ${HOME}/.fzf:${HOME}/.fzf \
  -v ${HOME}/.fzf.bash:${HOME}/.fzf.bash \
  -v ${HOME}/.fzf.zsh:${HOME}/.fzf.zsh \
  -v ${HOME}/.zshrc_fzf.sh:${HOME}/.zshrc_fzf.sh \
  -v ${HOME}/.getfiletype.sh:${HOME}/.getfiletype.sh \
  `` \
  `##### shell extra ` \
  -v ${HOME}/.config/nvim:${HOME}/.config/nvim \
  -v ${HOME}/.config/neofetch/config.conf:${HOME}/.config/neofetch/config.conf \
  -v ${HOME}/.fdignore:${HOME}/.fdignore \
  -v ${HOME}/.gitconfig:${HOME}/.gitconfig \
  -v ${HOME}/.gitattributes:${HOME}/.gitattributes \
  -v ${HOME}/.gitignore_global:${HOME}/.gitignore_global \
  -v ${HOME}/.local/share/nvim:${HOME}/.local/share/nvim \
  -v ${HOME}/.local/state/nvim:${HOME}/.local/state/nvim \
  -v ${HOME}/.cache/nvim:${HOME}/.cache/nvim \
  -v ${HOME}/.ssh:${HOME}/.ssh \
  -v ${HOME}/.vimdid:${HOME}/.vimdid \
  -v ${HOME}/.viminfo:${HOME}/.viminfo \
  -v ${HOME}/.vim_mru_files:${HOME}/.vim_mru_files \
  -v ${HOME}/.vimrc:${HOME}/.vimrc \
  -v ${HOME}/.config/bat:${HOME}/.config/bat \
  -v ${HOME}/.cache/bat:${HOME}/.cache/bat \
  -v ${HOME}/.cache/ccache:${HOME}/.cache/ccache \
  -v ${CONTAINER_DIR}/zoxide:${HOME}/.local/share/zoxide \
  `` \
  `##### rust ` \
  -v ${HOME}/.rustup:${HOME}/.rustup \
  -v ${HOME}/.cargo:${HOME}/.cargo \
  `` \
  `##### work dirs ` \
  -v ${HOME}/Applications:${HOME}/Applications \
  -v ${HOME}/backup:${HOME}/backup \
  -v ${HOME}/container:${HOME}/container \
  -v ${HOME}/Desktop:${HOME}/Desktop \
  -v ${HOME}/Documents:${HOME}/Documents \
  -v ${HOME}/dotfiles.pub:${HOME}/dotfiles.pub \
  -v ${HOME}/dotfiles.prv:${HOME}/dotfiles.prv \
  -v ${HOME}/Downloads:${HOME}/Downloads \
  -v ${HOME}/github:${HOME}/github \
  -v ${HOME}/images:${HOME}/images \
  -v ${HOME}/obsidian:${HOME}/obsidian \
  -v ${HOME}/Pictures:${HOME}/Pictures \
  -v ${HOME}/project:${HOME}/project \
  -v ${HOME}/services:${HOME}/services \
  -v ${HOME}/test:${HOME}/test \
  -v ${HOME}/tmp:${HOME}/tmp \
  -v ${HOME}/tools:${HOME}/tools \
  -v ${HOME}/ws:${HOME}/ws \
  `` \
  `##### bind-mounts ` \
  -v /java:/java \
  -v /mnt:/mnt \
  -v /opt/amazon:/opt/amazon \
  -v /opt/appimages:/opt/appimages \
  -v /opt/bin:/opt/bin \
  -v /opt/jdk:/opt/jdk \
  -v /opt/toolchain:/opt/toolchain \
  -v /opt/tools:/opt/tools \
  `` \
  `##### ` \
  -w $(pwd) \
  $IMG /bin/zsh
