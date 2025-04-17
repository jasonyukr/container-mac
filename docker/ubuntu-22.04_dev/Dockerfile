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

# Install git
RUN apt-get -y install git

# Install fuse to support appimage
RUN apt-get -y install fuse libfuse2

# Install other utility
RUN apt-get -y install zsh curl xsel wget p7zip-full xclip

# Install cmake
RUN apt-get -y install cmake

# Install neofetch
RUN apt-get -y install neofetch

# Get username from caller
ARG username

# Create default user ( uid=501 on macOS )
RUN groupadd -r $username -g 1000 && \
    useradd -m -u 501 -r -g $username $username && \
    echo "$username:1111" | chpasswd && \
    adduser $username sudo

WORKDIR /home/$username
