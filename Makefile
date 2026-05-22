# dotfiles - automated configuration deployment

SHELL        := /bin/bash
DOTFILES_DIR := $(CURDIR)
CONFIG_DIR   := $(HOME)/.config
BACKUP_DIR   := $(HOME)/.dotfiles_backup/$(shell date +%Y%m%d_%H%M%S)

# List of files/directories to symlink
MANAGED_FILES := \
	"$(CONFIG_DIR)/nvim" \
	"$(HOME)/.tmux.conf" \
	"$(CONFIG_DIR)/ghostty" \
	"$(CONFIG_DIR)/kitty" \
	"$(HOME)/.aliases"

.PHONY: all nvim tmux ghostty kitty aliases verify clean help

all: nvim tmux ghostty kitty aliases ## Install all configurations

# Centralized backup and symlink logic
# 1. Check if the target is a real file/dir (not a symlink)
# 2. If it is, move it to a timestamped central backup directory
# 3. Create/overwrite the symlink
define safe_link
	@if [ -e "$(2)" ] && [ ! -L "$(2)" ]; then \
		mkdir -p "$(BACKUP_DIR)"; \
		echo "Backing up $(2) to $(BACKUP_DIR)"; \
		mv "$(2)" "$(BACKUP_DIR)/"; \
	fi
	@mkdir -p "$$(dirname "$(2)")"
	@ln -sfn "$(1)" "$(2)"
endef

nvim: ## Link Neovim configuration
	$(call safe_link,$(DOTFILES_DIR)/nvim,$(CONFIG_DIR)/nvim)

tmux: ## Link tmux configuration
	$(call safe_link,$(DOTFILES_DIR)/.tmux.conf,$(HOME)/.tmux.conf)

ghostty: ## Link Ghostty configuration
	$(call safe_link,$(DOTFILES_DIR)/ghostty,$(CONFIG_DIR)/ghostty)

kitty: ## Link Kitty configuration
	$(call safe_link,$(DOTFILES_DIR)/kitty,$(CONFIG_DIR)/kitty)

aliases: ## Link shell aliases
	$(call safe_link,$(DOTFILES_DIR)/aliases,$(HOME)/.aliases)

verify: ## Verify symlink integrity and path correctness
	@echo "Verifying symlinks..."
	@for f in $(MANAGED_FILES); do \
		if [ -L "$$f" ]; then \
			TARGET=$$(readlink "$$f"); \
			if [[ "$$TARGET" == "$(DOTFILES_DIR)"* ]]; then \
				echo "✓ $$f -> $$TARGET"; \
			else \
				echo "✗ $$f points to a different location: $$TARGET"; \
				exit 1; \
			fi; \
		else \
			echo "✗ $$f is missing or not a symlink"; \
			exit 1; \
		fi; \
	done

clean: ## Remove managed symlinks
	@for f in $(MANAGED_FILES); do \
		if [ -L "$$f" ]; then \
			echo "Removing symlink $$f"; \
			rm "$$f"; \
		fi; \
	done

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
