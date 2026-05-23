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
	"$(CONFIG_DIR)/starship.toml"

# Conditional Shell Configuration
ifeq ($(shell uname), Darwin)
    SHELL_TARGET := zsh zsh-plugins
    MANAGED_FILES += "$(HOME)/.zshrc"
else
    SHELL_TARGET := bash
    MANAGED_FILES += "$(HOME)/.bashrc"
endif

.PHONY: all deps nvim tmux ghostty kitty aliases zsh zsh-plugins bash blesh starship verify doctor clean help

all: deps nvim tmux ghostty kitty aliases $(SHELL_TARGET) starship

doctor: verify ## Check system health and dependencies
	@echo "--- Checking Binaries ---"
	@for bin in nvim tmux ghostty kitty starship zoxide fzf rg; do \
		if command -v $$bin >/dev/null; then \
			echo "✓ $$bin is installed"; \
		else \
			echo "✗ $$bin is MISSING"; \
		fi; \
	done
	if command -v fd >/dev/null || command -v fdfind >/dev/null; then \
		echo "✓ fd is installed"; \
	else \
		echo "✗ fd is MISSING"; \
	fi
	@echo "--- Checking ZSH Plugins ---"
	@for plugin in zsh-autosuggestions zsh-syntax-highlighting; do \
		if [ -d "$(HOME)/.oh-my-zsh/custom/plugins/$$plugin" ]; then \
			echo "✓ $$plugin is installed"; \
		else \
			echo "✗ $$plugin is MISSING (run 'make zsh-plugins')"; \
		fi; \
	done

zsh-plugins: ## Install ZSH plugins
	@echo "Installing ZSH plugins..."
	@mkdir -p "$(HOME)/.oh-my-zsh/custom/plugins"
	@if [ ! -d "$(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then \
		git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions"; \
	fi
	@if [ ! -d "$(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then \
		git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"; \
	fi

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
		sudo add-apt-repository -y ppa:neovim-ppa/stable && sudo apt update; \
		sudo apt install -y neovim tmux xclip ripgrep fd-find unzip luarocks bat btop jq yq \
			shellcheck black isort yamllint ansible-lint python3-pip; \
	fi
	@if command -v go >/dev/null; then \
		echo "Installing Go tools..."; \
		go install github.com/incu6us/goimports-reviser/v3@latest; \
		go install github.com/segmentio/golines@latest; \
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

bash:
	$(call safe_link,$(DOTFILES_DIR)/.bashrc,$(HOME)/.bashrc)

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
