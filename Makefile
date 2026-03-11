# Symlink configurations to $HOME
# Use -f to force/overwrite existing files
# Use -s for symbolic links (prevents copying)

all: nvim tmux ghostty kitty aliases

nvim:
	mkdir -p ~/.config
	ln -sf $(PWD)/nvim ~/.config/nvim

tmux:
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf

ghostty:
	mkdir -p ~/.config/ghostty
	ln -sf $(PWD)/ghostty/config ~/.config/ghostty/config

kitty:
	mkdir -p ~/.config/kitty
	ln -sf $(PWD)/kitty/kitty.conf ~/.config/kitty/kitty.conf

aliases:
	# Note: This just links the file. You still need to source it in ~/.zshrc or ~/.bashrc
	ln -sf $(PWD)/aliases ~/.aliases
