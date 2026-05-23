# shellcheck shell=zsh

export ZSH="$HOME/.oh-my-zsh"

# Plugin bootstrap
if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH/custom/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH/custom/plugins/zsh-syntax-highlighting"
fi

plugins=(git docker kubectl zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# Environment
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH"
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

# Tool Completions
command -v kubectl &>/dev/null && source <(kubectl completion zsh)
command -v helm &>/dev/null && source <(helm completion zsh)
compdef k=kubectl

# FZF
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Initialization
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"

# Overrides
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
