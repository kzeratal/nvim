#!/bin/bash

set -e

NVIM_VERSION="v0.11.3"
NVIM_URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"
TEMP_DIR="/tmp/nvim-install"

echo "Installing Neovim ${NVIM_VERSION}..."

# Create temporary directory
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

# Download Neovim
echo "Downloading Neovim..."
wget "$NVIM_URL" -O nvim-linux-x86_64.tar.gz

# Extract the archive
echo "Extracting archive..."
tar -xzf nvim-linux-x86_64.tar.gz

# Install to system directories
echo "Installing to system directories..."
sudo cp nvim-linux-x86_64/bin/nvim /usr/local/bin/
sudo cp -r nvim-linux-x86_64/share/* /usr/local/share/
sudo cp -r nvim-linux-x86_64/lib/* /usr/local/lib/

# Clean up
echo "Cleaning up..."
cd /
rm -rf "$TEMP_DIR"

echo "Neovim ${NVIM_VERSION} installed successfully!"
echo "Run 'nvim --version' to verify the installation."