#!/bin/bash

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
git config --global user.name "Carolyn Sun"
git config --global user.signingkey 58058FF41FEE360BBA0D9A38999983EBF216FCFF
## signature
git config --global commit.gpgsign true
## gpg app path
git config --global gpg.program "/usr/local/MacGPG2/bin/gpg"