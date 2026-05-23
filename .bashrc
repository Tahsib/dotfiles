# .bashrc

# Environment
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Language Paths
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Prompt
if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi
