# Ubuntu 22.04 LTS (Jammy Jellyfish)
FROM ubuntu:22.04

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

# Install essential packages
RUN apt-get -y install zip unzip tar sudo lsb-release build-essential vim file

# Install packages required to build jvm
RUN apt-get -y install libx11-dev libxext-dev libxrender-dev libxtst-dev libxt-dev libfontconfig1-dev libasound2-dev libcups2-dev autoconf csh

# Install 32-bit support
RUN apt-get -y install libc6-i386 lib32stdc++6 lib32z1

# Install armhf gcc-11
#RUN apt-get -y install gcc-11-arm-linux-gnueabihf g++-11-arm-linux-gnueabihf
# Use armhf gcc-11 by default
#RUN update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-11 100 \
#        --slave /usr/bin/arm-linux-gnueabihf-cpp arm-linux-gnueabihf-cpp /usr/bin/arm-linux-gnueabihf-cpp-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-g++ arm-linux-gnueabihf-g++ /usr/bin/arm-linux-gnueabihf-g++-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-gcc-ar arm-linux-gnueabihf-gcc-ar /usr/bin/arm-linux-gnueabihf-gcc-ar-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-gcc-nm arm-linux-gnueabihf-gcc-nm /usr/bin/arm-linux-gnueabihf-gcc-nm-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-gcc-ranlib arm-linux-gnueabihf-gcc-ranlib /usr/bin/arm-linux-gnueabihf-gcc-ranlib-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-gcov arm-linux-gnueabihf-gcov /usr/bin/arm-linux-gnueabihf-gcov-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-gcov-dump arm-linux-gnueabihf-gcov-dump /usr/bin/arm-linux-gnueabihf-gcov-dump-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-gcov-tool arm-linux-gnueabihf-gcov-tool /usr/bin/arm-linux-gnueabihf-gcov-tool-11 \
#        --slave /usr/bin/arm-linux-gnueabihf-lto-dump arm-linux-gnueabihf-lto-dump /usr/bin/arm-linux-gnueabihf-lto-dump-11

# Install git
RUN apt-get -y install git

# Install fuse to support appimage
RUN apt-get -y install fuse libfuse2

# Install other utility
RUN apt-get -y install zsh curl xsel wget p7zip-full xclip
WORKDIR /tmp
#RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
#RUN dpkg -i ripgrep_13.0.0_amd64.deb
#RUN curl -LO https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
#RUN dpkg -i bat_0.19.0_amd64.deb
#RUN curl -LO https://github.com/sharkdp/fd/releases/download/v8.3.2/fd_8.3.2_amd64.deb
#RUN dpkg -i fd_8.3.2_amd64.deb

# Install cmake (for building apps like alacritty)
RUN apt-get -y install cmake

# Install neofetch
RUN apt-get -y install neofetch

# Get username from caller
ARG username

# Create default user
RUN groupadd -r $username -g 1000 && \
    useradd -m -u 1000 -r -g $username $username && \
    echo "$username:1111" | chpasswd && \
    adduser $username sudo

WORKDIR /home/$username
