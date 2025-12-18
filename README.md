# atmosx dotfiles

CLI configuration files (dotfiles) that I use daily on multiple computers.

## Goodies

I'm using the [MacPorts](https://www.macports.org/) package manager.
These applications must be installed via MacPorts for a smooth setup:
- Applications:
    - sqlit-tui: database connection (via pip)
    - ghostty: terminal emulator for macos (dmg installation)
    - MacPorts:
        - autojump - jump around
        - direnv - environment manager
        - git-delta - modern diff viewer
        - stow - as a dotfile manager
        - tmux - use `<bind> + I` to install the plugins!
        - programming languages and version/session/buffer managers:
            - python v3.12.x (via vim)
            - golang - doesn't require a version manager \o/
            - nvm - nodeJS version manager
            - rbenv - ruby version manager
            - ruby-build
            - tmuxinator - tmux session manager
        - vim 9.x +python312 +tcl +cscope +lua 
            - fzf - modern fuzzy finder
            - shellcheck - syntax highlighting, used by vim "Ale" plugin
            - pretier  - syntax highlighting, used by vim "Ale" plugin
            - the_silver_searcher - A code searching tool similar to ack, with a focus on speed
- [0xProto Nerd Font](https://www.nerdfonts.com/font-downloads) for terminal.
