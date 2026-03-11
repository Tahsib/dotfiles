# Makefile for dotfiles

# Use $(CURDIR) for absolute paths, which is more reliable in Make than $(PWD)
DOTFILES_DIR := $(CURDIR)
CONFIG_DIR   := $(HOME)/.config

.PHONY: all nvim tmux ghostty kitty aliases clean help

all: nvim tmux ghostty kitty aliases ## Install all configurations

# Helper to safely symlink. 
# 1. If it's a real directory/file (not a link), back it up with a timestamp to avoid overwriting previous backups
# 2. Use ln -sfn: 
#    -s: symbolic
#    -f: force (overwrite existing symlinks)
#    -n: treat symlink to directory as a file (crucial for macOS/BSD to prevent nesting)
define safe_link
	@if [ -e "$(2)" ] && [ ! -L "$(2)" ]; then \
		BACKUP="$(2).backup_$$(date +%Y%m%d_%H%M%S)"; \
		echo "Backing up existing $(2) to $$BACKUP"; \
		mv "$(2)" "$$BACKUP"; \
	fi
	ln -sfn "$(1)" "$(2)"
endef

nvim: ## Symlink Neovim config directory
	@mkdir -p "$(CONFIG_DIR)"
	$(call safe_link,$(DOTFILES_DIR)/nvim,$(CONFIG_DIR)/nvim)

tmux: ## Symlink tmux config
	$(call safe_link,$(DOTFILES_DIR)/.tmux.conf,$(HOME)/.tmux.conf)

ghostty: ## Symlink Ghostty config directory
	@mkdir -p "$(CONFIG_DIR)"
	$(call safe_link,$(DOTFILES_DIR)/ghostty,$(CONFIG_DIR)/ghostty)

kitty: ## Symlink Kitty config directory
	@mkdir -p "$(CONFIG_DIR)"
	$(call safe_link,$(DOTFILES_DIR)/kitty,$(CONFIG_DIR)/kitty)

aliases: ## Symlink aliases file
	$(call safe_link,$(DOTFILES_DIR)/aliases,$(HOME)/.aliases)
	@echo "Note: Ensure your shell config (~/.zshrc or ~/.bashrc) sources ~/.aliases"
	@echo '      Add this: [ -f ~/.aliases ] && . ~/.aliases'

clean: ## Remove only the symlinks created by this Makefile
	@for f in "$(CONFIG_DIR)/nvim" "$(HOME)/.tmux.conf" "$(CONFIG_DIR)/ghostty" "$(CONFIG_DIR)/kitty" "$(HOME)/.aliases"; do \
		if [ -L "$$f" ]; then \
			echo "Removing symlink $$f"; \
			rm "$$f"; \
		fi; \
	done

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
