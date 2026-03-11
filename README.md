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
- **UX:** Borderless, clean look with a draggable top-edge zone.

---

## 📦 Installation

### 1. Install System Dependencies

#### macOS
```bash
# Core Tools
brew install nvim tmux ghostty ripgrep fd fzf luarocks

# Language Bridges & Support
luarocks install jsregexp
npm install -g neovim
pip install pynvim

# Font (Critical for icons)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

#### Ubuntu
```bash
# Core Tools
sudo apt update && sudo apt install neovim tmux xclip ripgrep fd-find unzip luarocks -y

# Language Support
npm install -g neovim
pip install pynvim

# Font (JetBrains Mono Nerd Font)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip && rm JetBrainsMono.zip
fc-cache -fv
```

### 2. Setup Symlinks
Clone this repo to `~/dotfiles` and run:

```bash
# Create config directory
mkdir -p ~/.config

# Symlink everything
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/ghostty ~/.config/ghostty
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

### 3. Initialize Plugins
**Tmux (TPM):**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# Inside tmux: Press 'Prefix' (Ctrl+Space) then 'I' (capital i) to install
```

**Neovim:**
Launch `nvim`. Lazy.nvim and Mason will automatically install all plugins and LSPs.

---

## 🌍 SRE Muscle Memory (Universal Aliases)
To enable shared aliases and Go paths across Zsh and Bash, add this to your `~/.zshrc` (Mac) or `~/.bashrc` (Ubuntu):

```bash
[ -f ~/dotfiles/aliases ] && source ~/dotfiles/aliases
```

---

## ⌨️ Essential Shortcuts

| Category | Keybinding | Action |
| :--- | :--- | :--- |
| **Leader** | `Space` | The "Leader" key for all shortcuts |
| **Navigation** | `Ctrl + h/j/k/l` | Move between ALL panes (Vim & Tmux) |
| **Finder** | `<Leader>ff` | Find Files (Telescope) |
| **Explorer** | `<Leader>e` | Toggle Neo-tree sidebar |
| **File Edit** | `-` | Edit directory with Oil.nvim |
| **Terminal** | `<Leader>t` | Toggle bottom terminal |
| **LSP** | `gd` / `K` | Go to Definition / Hover Docs |
| **Rename** | `<Leader>rn` | Rename symbol project-wide |
| **Format** | `<Leader>gf` | Manual format file |
| **Comment** | `gcc` | Comment out current line |

---

## 📝 License
Built with ☕ and 🧠 by [YOUR_NAME](https://github.com/YOUR_NAME).
