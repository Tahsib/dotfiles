# shellcheck shell=zsh

export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(git docker kubectl zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh safely and silently
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  # Standardize plugin loading - OmZ handles the $plugins array
  source "$ZSH/oh-my-zsh.sh"
else
  # Minimal fallback if Oh My Zsh is missing (for basic functionality)
  autoload -Uz compinit && compinit
  # Basic aliases to keep moving
  alias l='ls -lah'
fi

# Environment
if [[ "$OSTYPE" == "darwin"* ]]; then
  [ -d "/opt/homebrew/bin" ] && export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export TERMINAL="ghostty"
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

# Lazy load completions for heavy tools
if (( $+commands[kubectl] )); then
  # Cache kubectl completion for speed
  if [ ! -f "$HOME/.kube/completion.zsh" ]; then
    mkdir -p "$HOME/.kube"
    kubectl completion zsh > "$HOME/.kube/completion.zsh"
  fi
  source "$HOME/.kube/completion.zsh"
  compdef k=kubectl
fi

if (( $+commands[helm] )); then
  # Cache helm completion
  if [ ! -f "$HOME/.helm/completion.zsh" ]; then
    mkdir -p "$HOME/.helm"
    helm completion zsh > "$HOME/.helm/completion.zsh"
  fi
  source "$HOME/.helm/completion.zsh"
fi

# FZF
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
if (( $+commands[fdfind] )); then
  export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
elif (( $+commands[fd] )); then
  export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Initialization
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
(( $+commands[starship] )) && eval "$(starship init zsh)"

# Overrides
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
