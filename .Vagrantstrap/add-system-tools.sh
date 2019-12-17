#!/bin/bash

# update the system
apt-get update && apt-get upgrade -y

# install docker
curl -o- https://get.docker.com | sh

# install docker compose
curl -fsSL "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

# install system dependencies for pyenv
sudo apt-get update && sudo apt-get install -y build-essential curl git libbz2-dev libffi-dev liblzma-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev llvm make python-openssl tk-dev wget xz-utils zlib1g-dev