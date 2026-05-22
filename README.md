# dotfiles

Development environment configurations for macOS and Linux.

## Requirements

- **Neovim**: v0.11.x (Pinned via `lazy-lock.json`)
- **Tmux**: 3.2+
- **Terminal**: Ghostty or Kitty
- **Font**: JetBrains Mono Nerd Font

## Technical Stack

### Neovim
- **Plugin Manager**: `lazy.nvim`
- **LSP**: Native configuration for Go, Python, Terraform, and YAML
- **Formatting**: `none-ls` (`black`, `goimports`)
- **Core Plugins**: `telescope.nvim`, `oil.nvim`, `toggleterm.nvim`

### Tmux
- **Prefix**: `C-Space`
- **Theme**: Catppuccin Mocha
- **Navigation**: `vim-tmux-navigator` for seamless split/pane movement

## Installation

### 1. Dependencies

**macOS:**
```bash
brew install nvim tmux ripgrep fd fzf luarocks ghostty
brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font
```

**Ubuntu:**
```bash
sudo apt update && sudo apt install neovim tmux xclip ripgrep fd-find unzip luarocks -y
```

### 2. Deployment
Uses a `Makefile` to handle symlinking and timestamped backups of existing configs.

```bash
git clone <repository_url> ~/dotfiles
cd ~/dotfiles
make all
```

### 3. Initialization
- **Tmux**: Install [TPM](https://github.com/tmux-plugins/tpm), then press `Prefix + I`.
- **Neovim**: Launch `nvim`; `lazy.nvim` and `mason.nvim` will bootstrap the environment.

## Keybindings

| Key | Action |
| :--- | :--- |
| `Space` | Leader |
| `C-h/j/k/l` | Navigate splits/panes |
| `<Leader>ff` | Telescope find files |
| `<Leader>e` | Neo-tree toggle |
| `-` | Oil.nvim directory editor |
| `<Leader>t` | Toggle terminal |
| `gd` | LSP definition |
| `K` | LSP hover |

## License
MIT
