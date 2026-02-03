#!/bin/bash

# Sync configs to backup directory

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/backup"

mkdir -p "$BACKUP_DIR"

echo "Syncing configs to $BACKUP_DIR ..."

# 从 list 文件读取配置并备份
while IFS=: read -r src dest || [ -n "$src" ]; do
    # 跳过空行和注释
    [[ -z "$src" || "$src" =~ ^# ]] && continue
    # 展开 ~
    src="${src/#\~/$HOME}"
    if [ -f "$src" ]; then
        cp "$src" "$BACKUP_DIR/$dest"
        echo "✓ $dest"
    fi
done < "$SCRIPT_DIR/list"

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
