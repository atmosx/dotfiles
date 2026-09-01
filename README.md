# atmosx dotfiles

I'm using the [MacPorts](https://www.macports.org/) package manager. These applications must be installed via MacPorts for a smooth setup:

- Applications:
    - sqlit-tui: database connection (via pip)
    - ghostty: terminal emulator for macos (dmg installation)
        - fonts: [0xProto Nerd Font](https://www.nerdfonts.com/font-downloads) for terminal
    - MacPorts:
        - tig: command git repository browser
        - gnupg2: required by other apps
        - autojump: jump around
        - direnv: environment manager
        - git-delta: modern diff viewer
        - stow: as a dotfiles manager
        - age: modern cli file encryption utility
        - atuin: shared zsh history between hosts
        - 1Password-cli: 1Password manage command line application
        - magic-wormhole:  transfer files securely from one computer to another
        - tmux: use `<bind> + I` to install the plugins
        - tmux-pasteboard: required by local tmux configuration
        - python v3.12.x (via vim)
        - golang: doesn't require a version manager \o/
        - nvm: nodeJS version manager. Required by pi-agent (see bellow) and other apps.
        - rbenv: ruby version manager:
          - ruby: latest stable available works, set it to `global` (`rbenv versions && rbenv global <version>`)
          - tmuxinator: a ruby-based tmux session manager (via gem)
        - ruby-build: required by rbenv
        - py312-awscli2: AWS command line
        - cmake: required by YCM vim plugin
        - vim 9.x +python312 +tcl +cscope +lua 
        - fzf: modern fuzzy finder (required by vim config)
        - shellcheck: syntax highlighting, used by vim "Ale" plugin (required by vim config)
        - the_silver_searcher: A code searching tool similar to ack, with a focus on speed (required by vim config)
        - mise: an environment and version manager
        - pi-agent: install a lean LLM agent and extensions: 
            - tinyLLM:  `pi install npm:tinyllm`
            - rk optimizer: `pi install npm:pi-rtk-optimizer`

## Other apps

Doppler command line (no MacPorts support):

```
(curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh
```
