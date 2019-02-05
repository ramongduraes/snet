#!/usr/bin/env bash

# SNET CLI v0.1.9
# Update, install SNET CLI dependencies, Python3.6 and SNET-CLI
apt-get update && \
apt-get install -y \
    git \
    libudev-dev \
    libusb-1.0-0-dev \
    nodejs \
    npm \
    python3 \
    python3-pip && \
cd /opt && \
git clone https://github.com/singnet/snet-cli && \
cd snet-cli && \
./scripts/blockchain install && \
pip3 install -e .
