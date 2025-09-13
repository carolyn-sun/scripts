#!/bin/zsh

# add current folder to PATH
# shellcheck disable=SC2155
export PATH="$PATH:$(pwd)"

# shell proxy
## set proxy for zsh
echo 'export all_proxy="http://127.0.0.1:6152"' >> ~/.zprofile
## set proxy for bash
## shellcheck disable=SC2016
echo 'export http_proxy="127.0.0.1:6152";export https_proxy=$http_proxy' >> ~/.bashrc

# brew
## install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## install apps from brew bundle
brew bundle --file=./Brewfile

# git
## set proxy for git
git config --global http.proxy http://127.0.0.1:6152
git config --global https.proxy http://127.0.0.1:6152
## git lfs filter
git config --global filter.lfs.clean "git-lfs clean -- %f"
git config --global filter.lfs.smudge "git-lfs smudge -- %f"
git config --global filter.lfs.process "git-lfs filter-process"
git config --global filter.lfs.required true
## git user info
git config --global user.email "117613176+carolyn-sun@users.noreply.github.com"
git config --global user.name "Carolyn"
git config --global user.signingkey CF65594A9A28BFF655A6D862DED2EA3A5A20EEB9
## signature
git config --global commit.gpgsign true
## gpg app path
git config --global gpg.program "/usr/local/MacGPG2/bin/gpg"

# default apps
## set default text editor
duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.data all
duti -s com.microsoft.VSCode md all
## set default archive utility
duti -s com.aone.keka public.zip-archive all
duti -s com.aone.keka com.rarlab.rar-archive all
duti -s com.aone.keka org.7-zip.7-zip-archive all
duti -s com.aone.keka public.tar-archive all
duti -s com.aone.keka org.gnu.gnu-zip-archive all