#!/bin/bash

# brew
## install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## install apps from brew bundle
brew bundle --file=./Brewfile