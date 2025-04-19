# Oracle Linux 9
FROM container-registry.oracle.com/os/oraclelinux:9

RUN dnf -y update

# Enable Developer and EPEL Repositories for Oracle Linux
RUN dnf -y install oraclelinux-developer-release-el9 oracle-epel-release-el9

# Enable Oracle Linux 9 CodeReady Builder repository
RUN yum-config-manager --enable ol9_codeready_builder

# Install essential packages
RUN dnf -y install zip unzip tar sudo vim file git
# The same for build-essential in debian
RUN dnf -y install make automake gcc gcc-c++ kernel-devel libstdc++-static

# Install 32-bit support
RUN dnf -y install glibc-devel glibc-devel.i686

# Install fuse to support appimage
RUN dnf -y install fuse fuse-libs

# Install other utility
RUN dnf -y install zsh curl xsel wget p7zip xclip
RUN dnf -y install tree

# Install cmake
RUN dnf -y install cmake

# Install packages required to build jvm
RUN dnf -y install libX11-devel libXext-devel libXrender-devel libXtst-devel libXt-devel fontconfig-devel alsa-lib-devel cups-devel autoconf csh

# Install tools for autocomplete
RUN dnf -y install sqlite python3

# Install i686 packages for 32-bit jvm run
RUN dnf -y install glibc.i686 zlib.i686

# Tools for git compilation
RUN yum -y install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel glibc-devel
# Download, compile and install git-2.48.1
WORKDIR /root
RUN wget https://github.com/git/git/archive/refs/tags/v2.48.1.tar.gz
RUN tar -zxf v2.48.1.tar.gz
WORKDIR /root/git-2.48.1
RUN make configure
RUN ./configure --prefix=/usr
RUN make install

# Build and install musl-libc
WORKDIR /root
RUN wget https://musl.libc.org/releases/musl-1.2.5.tar.gz
RUN tar -xvzf musl-1.2.5.tar.gz
WORKDIR /root/musl-1.2.5
RUN ./configure
RUN make
RUN make install

# Install neofetch
RUN dnf -y install neofetch

# Get username from caller
ARG username

# Create default user
RUN groupadd -r $username -g 501 && \
    useradd -m -u 501 -r -g $username $username && \
    echo "$username:1111" | chpasswd && \
    usermod -aG wheel $username

WORKDIR /home/$username
