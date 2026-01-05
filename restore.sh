#!/bin/bash

# Restore configs from backup and setup system

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/backup"

echo "===== Restoring configs ====="

# Shell
echo "Setting up shell..."
## Proxy
echo 'export all_proxy="http://127.0.0.1:6152"' >> ~/.zprofile
# shellcheck disable=SC2016
echo 'export http_proxy="127.0.0.1:6152";export https_proxy=$http_proxy' >> ~/.bashrc
## Case-insensitive completion
echo "set completion-ignore-case on" >> ~/.inputrc
echo "zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'" >> ~/.zshrc
echo "✓ Shell"

# 从 list 文件读取配置并恢复
while IFS=: read -r src dest || [ -n "$src" ]; do
    # 跳过空行和注释
    [[ -z "$src" || "$src" =~ ^# ]] && continue
    # 展开 ~
    src="${src/#\~/$HOME}"
    if [ -f "$BACKUP_DIR/$dest" ]; then
        mkdir -p "$(dirname "$src")"
        cp "$BACKUP_DIR/$dest" "$src"
        echo "✓ $dest"
    else
        echo "✗ backup/$dest not found"
    fi
done < "$SCRIPT_DIR/list"

# Homebrew
if [ -f "$BACKUP_DIR/Brewfile" ]; then
    # Install brew if not installed
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # Install apps from Brewfile
    brew bundle --file="$BACKUP_DIR/Brewfile"
    echo "✓ Brewfile"
else
    echo "✗ backup/Brewfile not found"
fi

# Default apps
echo "Setting default apps..."
## VS Code
duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.data all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .conf all
duti -s com.microsoft.VSCode .log all
duti -s com.microsoft.VSCode .vtt all
duti -s com.microsoft.VSCode .xml all
duti -s com.microsoft.VSCode .html all
duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .ts all
duti -s com.microsoft.VSCode .jsx all
duti -s com.microsoft.VSCode .tsx all
duti -s com.microsoft.VSCode .py all
duti -s com.microsoft.VSCode .yml all
duti -s com.microsoft.VSCode .yaml all
duti -s com.microsoft.VSCode public.xml all
duti -s com.microsoft.VSCode public.json all
duti -s com.microsoft.VSCode public.yaml all
duti -s com.microsoft.VSCode public.csv all
duti -s com.microsoft.VSCode public.source-code all
## Keka
duti -s com.aone.keka public.zip-archive all
duti -s com.aone.keka com.rarlab.rar-archive all
duti -s com.aone.keka org.7-zip.7-zip-archive all
duti -s com.aone.keka public.tar-archive all
duti -s com.aone.keka org.gnu.gnu-zip-archive all
echo "✓ Default apps"

echo "===== All done ====="
