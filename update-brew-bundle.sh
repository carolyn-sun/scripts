#!/bin/zsh
brew update
brew upgrade
brew cleanup -s
rm -f ./Brewfile
brew bundle dump --file=./Brewfile --describe
if [[ $(git status --porcelain) ]]; then
    git add ./Brewfile
    git commit -m "Update Brewfile"
    git push origin main
fi