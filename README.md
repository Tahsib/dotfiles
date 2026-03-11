# 🚀 Professional SRE Dotfiles

A high-performance, keyboard-centric development and infrastructure management environment optimized for **macOS** (Zsh) and **Ubuntu** (Bash).

---

## 🛠 Features

### 💻 Neovim (IDE)
- **LSP:** Auto-configured for Python, Go, Terraform, YAML, and HTML.
- **Formatter:** Auto-format on save (Black for Python, Goimports for Go).
- **Navigation:** Seamless Ctrl+h/j/k/l movement between Neovim and Tmux panes.
- **Discovery:** WhichKey popup for all shortcuts (Leader is `Space`).
- **File System:** Oil.nvim (edit your filesystem like a text buffer).
- **Finder:** Telescope for blazing fast file, symbol, and grep search.

### 🔳 Tmux (Multiplexer)
- **Theme:** Catppuccin Mocha.
- **Prefix:** `Ctrl + Space` (SRE-optimized for speed).
- **Plugin:** TPM for plugin management.
- **Navigation:** Integrated with Neovim for seamless window switching.

### 🐈 Kitty (Terminal)
- **Font:** JetBrains Mono Nerd Font.
- **Theme:** Catppuccin Mocha.
- **Performance:** Optimized for zero-latency input.
- **Transparency:** 95% opacity with macOS background blur.

---

## 📦 Installation

### 1. Prerequisites (macOS)
```bash
brew install nvim tmux kitty ripgrep fd fzf
```

### 1. Prerequisites (Ubuntu)
```bash
sudo apt update && sudo apt install neovim tmux kitty xclip ripgrep fd-find unzip -y
```

### 2. Setup Symlinks
```bash
# Backup existing configs
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.config/kitty ~/.config/kitty.bak

# Create new symlinks
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

### 3. Install Plugins
**Tmux (TPM):**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# Inside tmux: Press Ctrl+Space then I (capital i) to install plugins
```

**Neovim:**
Launch `nvim`. Lazy.nvim will automatically install all plugins on the first run.

---

## ⌨️ Common Shortcuts (Muscle Memory)

| Category | Keybinding | Action |
| :--- | :--- | :--- |
| **Leader** | `Space` | The "Leader" key for all shortcuts |
| **Navigation** | `Ctrl + h/j/k/l` | Seamlessly move between all panes |
| **Explorer** | `<Leader>e` | Toggle Neo-tree |
| **Files** | `<Leader>ff` | Find Files (Telescope) |
| **Grep** | `<Leader>fg` | Live Grep search |
| **Terminal** | `<Leader>t` | Toggle bottom terminal |
| **Git** | `]c` / `[c` | Jump between Git changes |
| **Oil** | `-` | Edit parent directory (Oil.nvim) |
| **Comment** | `gcc` | Comment out current line |

---

## 🌍 SRE Muscle Memory (Universal Aliases)
To enable shared aliases across Zsh and Bash, add this to your `~/.zshrc` (Mac) or `~/.bashrc` (Ubuntu):

```bash
[ -f ~/dotfiles/aliases ] && source ~/dotfiles/aliases
```

---

## 📝 License
Built with ☕ and 🧠 by [YOUR_NAME](https://github.com/YOUR_NAME).
