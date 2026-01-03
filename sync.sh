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
    brew bundle dump --force --file="$BACKUP_DIR/Brewfile"
    echo "✓ Brewfile"
fi

echo "All done."
