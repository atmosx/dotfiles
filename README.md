# atmosx dotfiles

I'm using the [MacPorts](https://www.macports.org/) package manager. These applications must be installed via MacPorts for a smooth setup:

- Applications:
    - sqlit-tui: database connection (via pip)
    - ghostty: terminal emulator for macos (dmg installation)
    - MacPorts:
        - tig - command git repository browser
        - gnupg2 - required by other apps
        - autojump - jump around
        - direnv - environment manager
        - git-delta - modern diff viewer
        - stow - as a dotfile manager
        - age - file encryption utility
        - atuin - shared history between linux hosts (self-hosted server)
        - 1Password-cli - 1Password manage command line application
        - magic-wormhole - transfer files securely from one computer to another
        - tmux - use `<bind> + I` to install the plugins
        - tmux-pasteboard - required by local tmux configuration
        - programming languages and version/session/buffer managers:
            - python v3.12.x (via vim)
            - golang - doesn't require a version manager \o/
            - nvm - nodeJS version manager
            - rbenv - ruby version manager
              - ruby - latest stable available works, set it to `global` (`rbenv versions && rbenv global <version>`)
              - tmuxinator - a tmux session manager (via gem)
            - py312-awscli2 - AWS command line
            - ruby-build
            - tmuxinator - tmux session manager
        - cmake - required by YCM vim plugin
        - vim 9.x +python312 +tcl +cscope +lua 
            - fzf - modern fuzzy finder
            - shellcheck - syntax highlighting, used by vim "Ale" plugin
            - the_silver_searcher - A code searching tool similar to ack, with a focus on speed
- [0xProto Nerd Font](https://www.nerdfonts.com/font-downloads) for terminal

## Work related

Doppler command line (no MacPorts support):

```
(curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh
```

Work related apps via MacPorts:
  - mise - an environment and version manager
