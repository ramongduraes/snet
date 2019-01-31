#!/usr/bin/env bash

# Update, install SNET Daemon and its dependencies
apt-get update && \
apt-get install -y wget && \
mkdir snet-daemon && \
cd snet-daemon && \
wget -q https://github.com/singnet/snet-daemon/releases/download/v0.1.6/snet-daemon-v0.1.6-linux-amd64.tar.gz && \
tar -xvf snet-daemon-v0.1.6-linux-amd64.tar.gz  && \
mv ./snet-daemon-v0.1.6-linux-amd64/snetd /usr/bin/snetd && \
cd .. && \
rm -rf snet-daemon

# Install SNET CLI dependencies and Python3.6
apt-get install -y \
    git \
    libudev-dev \
    libusb-1.0-0-dev \
    nodejs \
    npm \
    python3 \
    python3-pip

# Install snet-cli
cd /opt && \
git clone https://github.com/singnet/snet-cli && \
cd snet-cli && \
./scripts/blockchain install && \
pip3 install -e .
