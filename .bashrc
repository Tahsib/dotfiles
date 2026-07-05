# shellcheck shell=bash
# .bashrc - Portable Bash configuration

# Environment
# Add Homebrew paths conditionally for macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  [ -d "/opt/homebrew/bin" ] && export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# Standard paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Defaults
export TERMINAL="ghostty"
export EDITOR="nvim"

# Language Paths
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# History Configuration
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# FZF Configuration
if command -v fdfind &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
elif command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# Tool Initialization
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

# Completions (Lazy loaded with caching logic mirroring .zshrc)
if command -v kubectl &> /dev/null; then
  if [ ! -f "$HOME/.kube/completion.bash" ]; then
    mkdir -p "$HOME/.kube"
    kubectl completion bash > "$HOME/.kube/completion.bash"
  fi
  source "$HOME/.kube/completion.bash"
  alias k=kubectl
  complete -F __start_kubectl k
fi

if command -v helm &> /dev/null; then
  if [ ! -f "$HOME/.helm/completion.bash" ]; then
    mkdir -p "$HOME/.helm"
    helm completion bash > "$HOME/.helm/completion.bash"
  fi
  source "$HOME/.helm/completion.bash"
fi

# Overrides
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

: # Final command to ensure exit code 0

export NVM_DIR="$HOME/.nvm"
# Lazy load NVM to speed up shell startup
_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }
# alias kubectl='microk8s kubectl'
export OLLAMA_API_BASE=http://localhost:11434
alias coder='aider --no-git --map-tokens 1024'


# Added by Antigravity CLI installer
export PATH="/home/rahul/.local/bin:$PATH"
