#!/bin/zsh

# add current folder to PATH
# shellcheck disable=SC2155
export PATH="$PATH:$(pwd)"


./setup-shell-proxy.sh

./setup-brew.sh

./setup-git.sh

./setup-default-apps.sh
