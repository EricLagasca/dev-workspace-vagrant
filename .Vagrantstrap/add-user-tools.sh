#!/bin/bash

# add node version manager (nvm)
git clone https://github.com/nvm-sh/nvm.git ~/.nvm
cd ~/.nvm && git checkout v0.35.1

# add pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv