#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

backup_if_exists() {
    local target="$1"
    if [[ -e "$target" && ! -L "$target" ]]; then
        mv "$target" "${target}.bak.$(date +%Y%m%d%H%M%S)"
        echo "Backed up: $target"
    elif [[ -L "$target" ]]; then
        rm "$target"
    fi
}

link_file() {
    local src="$1"
    local dest="$2"
    backup_if_exists "$dest"
    ln -sf "$src" "$dest"
    echo "Linked: $dest -> $src"
}

deploy_linux() {
    echo "Deploying Linux configs..."
    mkdir -p ~/.config/nvim
    mkdir -p ~/.vim/undodir

    link_file "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
    link_file "$DOTFILES_DIR/zsh/.p10k.zsh" ~/.p10k.zsh
    link_file "$DOTFILES_DIR/nvim" ~/.config/nvim
    link_file "$DOTFILES_DIR/vimrc/.vimrc" ~/.vimrc
}

deploy_windows() {
    echo "Deploying Windows configs..."
    
    WIN_USER=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
    WIN_HOME="/mnt/c/Users/$WIN_USER"
    
    if [[ ! -d "$WIN_HOME" ]]; then
        echo "Windows home not found at $WIN_HOME"
        return 1
    fi

    mkdir -p "$WIN_HOME/.vim/undodir"

    backup_if_exists "$WIN_HOME/_vimrc"
    cp "$DOTFILES_DIR/vimrc/.vimrc" "$WIN_HOME/_vimrc"
    echo "Copied: $WIN_HOME/_vimrc"
}

deploy_linux

if grep -qi microsoft /proc/version 2>/dev/null; then
    deploy_windows
fi

echo "Deployment complete."
