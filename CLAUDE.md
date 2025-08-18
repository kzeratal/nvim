# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration using Lua and the Lazy.nvim plugin manager. The configuration follows a modular structure with plugins organized in separate files.

## Architecture

- **Entry Point**: `init.lua` - Sets basic Vim options and loads the Lazy plugin manager
- **Plugin Management**: `lua/configs/lazy.lua` - Bootstraps and configures Lazy.nvim
- **Plugin Definitions**: `lua/plugins/` - Individual plugin configurations:
  - `lsp.lua` - LSP configuration with Mason for language servers
  - `installer.lua` - Mason tool installer for automatic LSP/formatter installation  
  - `conform.lua` - Code formatting with format-on-save
  - `cmp.lua` - Code completion
  - `telescope.lua` - Fuzzy finder
  - `harpoon.lua` - File navigation
  - `treesitters.lua` - Syntax highlighting
  - `colorscheme.lua` - Theme configuration
  - `lightline.lua` - Status line

## Plugin Manager

Uses Lazy.nvim for plugin management. Plugin specifications are automatically imported from the `lua/plugins/` directory.

## Language Support

Configured language servers (via Mason):
- Bash (`bashls`)
- Lua (`lua_ls`) with Neovim-specific settings
- Python (`pyright`, `ruff`)
- Rust (`rust_analyzer`) 
- Slint (`slint_lsp`)
- TypeScript (`ts_ls`)
- C/C++ (`clangd`)

## Code Formatting

Uses Conform.nvim with format-on-save enabled (500ms timeout):
- Lua: `stylua` (with custom config in `style/.stylua.toml`)
- SQL: `sql_formatter`
- TypeScript: `prettierd`
- Bash: `shfmt` (via Mason tool installer)

## Tool Management

Mason tool installer automatically ensures the following tools are installed:
- Language servers: `bash-language-server`, `clangd`, `lua-language-server`, `ruff`, `rust-analyzer`, `slint-lsp`, `typescript-language-server`
- Formatters: `prettierd`, `shfmt`, `sql-formatter`, `stylua`

## Installation

The configuration is designed for Windows but works cross-platform. Installation involves:
1. Installing Neovim
2. Cloning this config to the appropriate Neovim config directory
3. Installing required runtimes (GCC, Node.js)

On first launch, Lazy.nvim will automatically install plugins and Mason will install the configured language servers and formatters.

## Key Mappings

- Leader key: Space (configured in both `init.lua` and `lua/configs/lazy.lua`)
- `<leader>pv`: Open file explorer (Ex command)
- LSP mappings (when LSP is attached):
  - `K`: Hover documentation
  - `gd`: Go to definition
  - `gi`: Go to implementation  
  - `gr`: Find references
  - `rn`: Rename symbol
  - `<C-h>` (insert mode): Signature help

## Development Workflow

- No build system or package manager required - this is a pure Neovim configuration
- Plugin management is handled by Lazy.nvim with lock file (`lazy-lock.json`)
- All tools (LSPs, formatters) are automatically installed via Mason
- Configuration changes take effect on Neovim restart
- Custom Slint filetype support is configured for `.slint` extensions