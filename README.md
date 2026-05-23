# dotfiles

Development environment configurations for macOS and Linux.

## Requirements

- **Neovim**: v0.12.2 (Verified)
- **Tmux**: 3.2+
- **Terminal**: Ghostty or Kitty
- **Shell**: Zsh or Bash
- **Font**: JetBrains Mono Nerd Font

## Technical Stack

### Shell
- **Prompt**: Starship
- **Navigation**: Zoxide (`z`), FZF (`Ctrl+R`, `Ctrl+T`)
- **Plugins**: Zsh-autosuggestions, Zsh-syntax-highlighting
- **History**: 50k lines, timestamped, cross-tab sharing

### Neovim
- **Plugin Manager**: `lazy.nvim`
- **LSP**: Native configuration for Go, Python, Terraform, and YAML
- **Formatting**: `none-ls` (`black`, `goimports`)
- **Core Plugins**: `telescope.nvim`, `oil.nvim`, `toggleterm.nvim`

### Tmux
- **Prefix**: `C-b`
- **Theme**: Catppuccin Mocha
- **Navigation**: `vim-tmux-navigator`

## Installation

### 1. Provision and Deploy
Runs OS detection, installs dependencies via `Brewfile` (macOS) or `apt` (Ubuntu), and establishes symlinks.

```bash
git clone https://github.com/Tahsib/dotfiles ~/dotfiles
cd ~/dotfiles
make all
```

### 2. Manual Steps
- **Tmux**: Install [TPM](https://github.com/tmux-plugins/tpm), then press `Prefix + I`.
- **Secrets**: Store sensitive environment variables in `~/.zshrc.local` (Git-ignored).

## Keybindings

| Key | Action |
| :--- | :--- |
| `Space` | Neovim Leader |
| `C-b` | Tmux Prefix |
| `z <dir>` | Zoxide jump |
| `C-r` | FZF history search |
| `C-t` | FZF file search |
| `C-h/j/k/l` | Pane navigation |
| `<Leader>ff` | Telescope find files |
| `<Leader>e` | Neo-tree toggle |
| `-` | Oil.nvim editor |
| `<Leader>t` | Toggle terminal |
| `gd` | LSP definition |
| `K` | LSP hover |

## License
MIT
