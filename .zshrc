# .zshrc

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH/custom/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH/custom/plugins/zsh-syntax-highlighting"
fi

plugins=(git docker kubectl zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# Environment
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export TERMINAL="kitty"
export EDITOR="nvim"

# History
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Options
setopt AUTO_CD
setopt CORRECT
setopt INTERACTIVE_COMMENTS
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Paths
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Completions
fpath=("$HOME/.docker/completions" $fpath)
autoload -Uz compinit && compinit

# Tools
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Overrides
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
