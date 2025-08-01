# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         autojump
         docker
         vi-mode
         rbenv
         nvm)
source $ZSH/oh-my-zsh.sh

# Load the local zsh helpers
[ -f "$HOME/.zsh_helpers" ] && . "$HOME/.zsh_helpers"

# Macports PATH and generic configuration opts
export PATH="/opt/local/bin:$HOME/Programs/bin:/usr/local/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR='vim'
export MANPATH="/usr/local/man:$MANPATH"
export GPG_TTY=$(tty)
export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"

# Golang Configuration
export GOPATH="$HOME/Programs" #Golang configuration

# Use the helper for the rest
maybe_eval direnv direnv hook zsh
maybe_eval atuin atuin init zsh
# maybe_eval rbenv rbenv init - zsh
# maybe_eval nvm - zsh

# autojump configuration 
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
  . /opt/local/etc/profile.d/autojump.sh
fi

# compinit setup with caching (once a day updates)
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# tfenv - Terraform version manager
TFENV_ARCH=arm
TFENV_CONFIG_DIR=~/.tfenv

# Check if 'rg' is available
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Source additional local configuration files
if [ -f "$HOME/.zsh_local_only" ]; then
  source "$HOME/.zsh_local_only"
fi

if [ -f "$HOME/.zsh_aliases" ]; then
  source "$HOME/.zsh_aliases"
fi
