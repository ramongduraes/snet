#!/usr/bin/env bash

# SNET Daemon v0.1.6
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