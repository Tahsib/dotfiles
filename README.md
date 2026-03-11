# 🚀 Professional SRE Dotfiles

A high-performance, keyboard-centric development and infrastructure management environment optimized for **macOS** (Ghostty/Zsh) and **Ubuntu** (Bash).

---

## 🛠 Features

### 💻 Neovim (Professional IDE)
- **Engine:** Neovim 0.11+ "Core" LSP setup (Native & Future-proof).
- **Languages:** Auto-configured for Python, Go, Terraform, YAML, and HTML.
- **Formatter:** None-LS (Auto-format on save: Black for Python, Goimports for Go).
- **Navigation:** Seamless `Ctrl + h/j/k/l` movement between Neovim splits and Tmux panes.
- **File System:** Oil.nvim (Edit your filesystem like a text buffer with `-`).
- **Finder:** Telescope for blazing fast file, symbol, and diagnostic search.

### 🔳 Tmux (Multiplexer)
- **Theme:** Catppuccin Mocha.
- **Prefix:** `Ctrl + Space` (SRE-optimized for speed).
- **Plugins:** TPM (Plugin Manager), Tmux-Yank, Vim-Tmux-Navigator.
- **Status Bar:** Professional top-bar layout with session and directory info.

### 🐈 Ghostty (Modern Terminal)
- **Speed:** Built with Zig for zero-latency input.
- **Aesthetic:** Catppuccin Mocha theme with native macOS background blur.
- **UX:** Borderless, draggable look with Cmd+Ctrl+Drag support.

---

## 📦 Installation

### 1. Prerequisites (macOS)
```bash
# Core Tools
brew install nvim tmux ghostty ripgrep fd fzf

# Language Bridges & Support
brew install luarocks jsregexp
npm install -g neovim
pip install pynvim
```

### 1. Prerequisites (Ubuntu)
```bash
# Core Tools
sudo apt update && sudo apt install neovim tmux xclip ripgrep fd-find unzip -y

# Language Support
sudo apt install npm python3-pip -y
npm install -g neovim
pip install pynvim
```

### 2. Setup Symlinks
```bash
# Backup existing configs
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.config/ghostty ~/.config/ghostty.bak

# Create new symlinks
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/ghostty ~/.config/ghostty
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

### 3. Install Plugins
**Tmux (TPM):**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# Inside tmux: Press Ctrl+Space then I (capital i) to install
```

**Neovim:**
Launch `nvim`. Lazy.nvim and Mason will automatically install all plugins and LSPs.

---

## ⌨️ Common Shortcuts (Muscle Memory)

| Category | Keybinding | Action |
| :--- | :--- | :--- |
| **Leader** | `Space` | The "Leader" key for all shortcuts |
| **Navigation** | `Ctrl + h/j/k/l` | Seamlessly move between all panes |
| **Finder** | `<Leader>ff` | Find Files (Telescope) |
| **Grep** | `<Leader>fg` | Live Grep search |
| **Explorer** | `<Leader>e` | Toggle Neo-tree sidebar |
| **File Edit** | `-` | Edit directory with Oil.nvim |
| **Terminal** | `<Leader>t` | Toggle bottom terminal |
| **LSP** | `gd` / `K` | Go to Definition / Hover Docs |
| **Rename** | `<Leader>rn` | Rename symbol project-wide |
| **Format** | `<Leader>gf` | Manual format file |
| **Comment** | `gcc` | Comment out current line |

---

## 🌍 SRE Muscle Memory (Universal Aliases)
To enable shared aliases and Go paths across Zsh and Bash, add this to your `~/.zshrc` (Mac) or `~/.bashrc` (Ubuntu):

```bash
[ -f ~/dotfiles/aliases ] && source ~/dotfiles/aliases
```

---

## 📝 License
Built with ☕ and 🧠 by [YOUR_NAME](https://github.com/YOUR_NAME).
