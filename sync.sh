#!/bin/bash

# Sync configs to backup directory

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/backup"

mkdir -p "$BACKUP_DIR"

echo "Syncing configs to $BACKUP_DIR ..."

if [ -f ~/.gitconfig ]; then
    cp ~/.gitconfig "$BACKUP_DIR/.gitconfig"
    echo "✓ .gitconfig"
fi

# Brewfile
if command -v brew &> /dev/null; then
    brew update
    brew upgrade
    brew cleanup -s
    brew bundle dump --force --describe --file="$BACKUP_DIR/Brewfile"
    echo "✓ Brewfile"
fi

# Git commit and push
if [[ $(git -C "$SCRIPT_DIR" status --porcelain) ]]; then
    git -C "$SCRIPT_DIR" add -A
    git -C "$SCRIPT_DIR" commit -m "Sync configs"
    git -C "$SCRIPT_DIR" push origin main
    echo "✓ Git pushed"
fi

echo "All done."
