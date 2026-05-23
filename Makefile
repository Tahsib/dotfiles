# Makefile

SHELL        := /bin/bash
DOTFILES_DIR := $(CURDIR)
CONFIG_DIR   := $(HOME)/.config
BACKUP_DIR   := $(HOME)/.dotfiles_backup/$(shell date +%Y%m%d_%H%M%S)

MANAGED_FILES := \
	"$(CONFIG_DIR)/nvim" \
	"$(HOME)/.tmux.conf" \
	"$(CONFIG_DIR)/ghostty" \
	"$(CONFIG_DIR)/kitty" \
	"$(HOME)/.aliases" \
	"$(HOME)/.zshrc" \
	"$(CONFIG_DIR)/starship.toml"

.PHONY: all deps nvim tmux ghostty kitty aliases zsh starship verify clean help

all: deps nvim tmux ghostty kitty aliases zsh starship

deps: ## Install system dependencies
	@echo "Checking system dependencies..."
	@if [[ "$$OSTYPE" == "darwin"* ]]; then \
		if command -v brew >/dev/null; then \
			echo "Installing macOS dependencies via Homebrew..."; \
			brew bundle --file=$(DOTFILES_DIR)/Brewfile; \
		else \
			echo "✗ Homebrew not found. Please install it first: https://brew.sh"; \
			exit 1; \
		fi; \
	elif [[ "$$OSTYPE" == "linux-gnu"* ]]; then \
		echo "Installing Ubuntu/Linux dependencies..."; \
		sudo apt update && sudo apt install -y nvim tmux xclip ripgrep fd-find unzip luarocks bat btop jq; \
	fi

define safe_link
	@if [ -e "$(2)" ] && [ ! -L "$(2)" ]; then \
		mkdir -p "$(BACKUP_DIR)"; \
		echo "Backing up $(2) to $(BACKUP_DIR)"; \
		mv "$(2)" "$(BACKUP_DIR)/"; \
	fi
	@mkdir -p "$$(dirname "$(2)")"
	@ln -sfn "$(1)" "$(2)"
endef

nvim:
	$(call safe_link,$(DOTFILES_DIR)/nvim,$(CONFIG_DIR)/nvim)

tmux:
	$(call safe_link,$(DOTFILES_DIR)/.tmux.conf,$(HOME)/.tmux.conf)

ghostty:
	$(call safe_link,$(DOTFILES_DIR)/ghostty,$(CONFIG_DIR)/ghostty)

kitty:
	$(call safe_link,$(DOTFILES_DIR)/kitty,$(CONFIG_DIR)/kitty)

aliases:
	$(call safe_link,$(DOTFILES_DIR)/aliases,$(HOME)/.aliases)

zsh:
	$(call safe_link,$(DOTFILES_DIR)/.zshrc,$(HOME)/.zshrc)

starship:
	$(call safe_link,$(DOTFILES_DIR)/starship.toml,$(CONFIG_DIR)/starship.toml)

verify:
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

clean:
	@for f in $(MANAGED_FILES); do \
		if [ -L "$$f" ]; then \
			echo "Removing symlink $$f"; \
			rm "$$f"; \
		fi; \
	done

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
