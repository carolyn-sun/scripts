#!/bin/zsh

echo "set completion-ignore-case on" >> ~/.inputrc
echo "zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'" >> ~/.zshrc
