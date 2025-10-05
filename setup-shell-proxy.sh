#!/bin/bash

# shell proxy
## set proxy for zsh
echo 'export all_proxy="http://127.0.0.1:6152"' >> ~/.zprofile
## set proxy for bash
# shellcheck disable=SC2016
echo 'export http_proxy="127.0.0.1:6152";export https_proxy=$http_proxy' >> ~/.bashrc