## Linux (Fedora)

### Clone and symlink config
```bash
git clone git@github-personal:kzeratal/nvim.git ~/repos/nvim
ln -s ~/repos/nvim ~/.config/nvim
```

### Launch
```bash
nvim
```

Lazy.nvim will auto-install plugins on first launch. Restart nvim once complete.

---

## Windows

### Clone nvim config from github
```bash
cd "$env:USERPROFILE\Appdata\Local"
git clone https://github.com/kzeratal/nvim.git
```

