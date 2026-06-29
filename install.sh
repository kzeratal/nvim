#!/bin/bash

# Install dependencies
if command -v brew &>/dev/null; then
    brew install fzf ripgrep
elif command -v dnf &>/dev/null; then
    sudo dnf install -y fzf ripgrep
elif command -v apt &>/dev/null; then
    sudo apt install -y fzf ripgrep
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Target directory for Neovim config
CONFIG_DIR="$HOME/.config/nvim"

# Remove existing config if it exists
if [ -L "$CONFIG_DIR" ]; then
    echo "Removing existing symlink at $CONFIG_DIR"
    rm "$CONFIG_DIR"
elif [ -d "$CONFIG_DIR" ]; then
    echo "Backing up existing config to $CONFIG_DIR.backup"
    mv "$CONFIG_DIR" "$CONFIG_DIR.backup"
fi

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

# Create the symlink
echo "Creating symlink: $CONFIG_DIR -> $SCRIPT_DIR"
ln -s "$SCRIPT_DIR" "$CONFIG_DIR"

echo "Neovim configuration linked successfully!"
echo "You can now start Neovim and it will use this configuration."