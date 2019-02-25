#!/usr/bin/env bash
# Removing images
docker rmi $(docker images | grep ramongduraes | awk '{print $3}')