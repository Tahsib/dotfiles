# 🚀 Professional SRE Dotfiles

A high-performance, keyboard-centric development and infrastructure management environment optimized for **macOS** (Zsh) and **Ubuntu** (Bash).

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

### 🖥 Supported Terminals (GPU Accelerated)
- **Ghostty:** (Primary) Built with Zig, native macOS feel, extreme performance.
- **Kitty:** (Alternative) Highly extensible, cross-platform, robust protocol support.
- **Both:** Pre-configured with Catppuccin Mocha and JetBrains Mono Nerd Font.

---

## 📦 Installation

### 1. Install System Dependencies

#### macOS
```bash
# Core Tools
brew install nvim tmux ripgrep fd fzf luarocks

# Choose your Terminal (or both)
brew install ghostty
brew install kitty

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
Clone this repo to your desired location (e.g., `~/dotfiles`) and run the included `Makefile` to securely back up any existing files (with timestamps) and create symlinks.

```bash
# Navigate to repo
cd ~/dotfiles

# See all available options
make help

# Use Makefile to automate symlinking for all configurations
make all

# Or install individual configurations
make nvim
make tmux
make ghostty
make kitty
make aliases

# Safely remove all symlinks created by this Makefile
make clean
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
[ -f ~/.aliases ] && source ~/.aliases
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
| **Format** | `<Leader>gf` | Manual format file |

---

## 📝 License
MIT License. Feel free to use and modify!
