#!/bin/zsh

# add current folder to PATH
# shellcheck disable=SC2155
export PATH="$PATH:$(pwd)"

# set proxy for zsh
echo 'export all_proxy="http://127.0.0.1:6152"' >> ~/.zprofile

# set proxy for bash
# shellcheck disable=SC2016
echo 'export http_proxy="127.0.0.1:6152";export https_proxy=$http_proxy' >> ~/.bashrc

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install app from brew bundle
brew bundle --file=./Brewfile

# set proxy for git
git config --global http.proxy http://127.0.0.1:6152
git config --global https.proxy http://127.0.0.1:6152

# set default text editor
duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.data all
duti -s com.microsoft.VSCode md all

# set default archive utility
duti -s com.aone.keka public.zip-archive all
duti -s com.aone.keka com.rarlab.rar-archive all
duti -s com.aone.keka org.7-zip.7-zip-archive all
duti -s com.aone.keka public.tar-archive all
duti -s com.aone.keka org.gnu.gnu-zip-archive all