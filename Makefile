# List of modules (directories inside dotfiles repo to be stowed)
MODULES = tmux zshrc vim atuin

# Default target
.PHONY: all
all: stow

# Stow dotfiles
.PHONY: stow
stow:
	@echo "Stowing: $(MODULES)"
	@for module in $(MODULES); do \
		stow --target=$(HOME) $$module; \
	done

# Unstow dotfiles
.PHONY: unstow
unstow:
	@echo "Unstowing: $(MODULES)"
	@for module in $(MODULES); do \
		stow -D --target=$(HOME) $$module; \
	done

# Renew = unstow + stow
.PHONY: renew
renew: unstow stow
	@echo "Renewed all modules"

# Help
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make stow     # Stow dotfiles"
	@echo "  make unstow   # Unstow dotfiles"
	@echo "  make renew    # Unstow then restow"

