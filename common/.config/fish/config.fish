set fish_greeting
fish_vi_key_bindings

# starship [https://github.com/starship/starship]
starship init fish | source

# Software preferences
set -gx BROWSER firefox
set -gx MOZ_ENABLE_WAYLAND 1
set -gx EDITOR nvim
set -gx VISUAL nvim

# Keep the home directory clean
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# Flutter and Android
set -gx CHROME_EXECUTABLE /usr/bin/chromium
set -gx PUB_CACHE $XDG_CACHE_HOME/pub
set -gx FVM_HOME $XDG_DATA_HOME/fvm
set -gx ANDROID_HOME $XDG_DATA_HOME/android-sdk
# fish_add_path $ANDROID_HOME/tools
# fish_add_path $ANDROID_HOME/tools/bin
# fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path /opt/flutter/bin

# Disable history
set -gx HISTFILE $HOME/.local/share/bash/history
set -gx LESSHISTFILE -

set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx CCACHE_CONFIGPATH $XDG_CONFIG_HOME/ccache.conf
set -gx CCACHE_DIR $XDG_CACHE_HOME/ccache
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/startup.py
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOMODCACHE $XDG_CACHE_HOME/go/mod
set -gx GRADLE_USER_HOME $XDG_DATA_HOME/gradle
abbr -a wget 'wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'

# Abbreviations
abbr -a s systemctl
abbr -a si 'systemctl status'
abbr -a se 'systemctl enable'
abbr -a sd 'systemctl disable'
abbr -a ss 'systemctl start'
abbr -a st 'systemctl stop'
abbr -a sr 'systemctl restart'
abbr -a d docker
abbr -a dc 'docker compose'
abbr -a r ranger-cd
abbr -a vi nvim
abbr -a rm 'rm -i'
abbr -a ls 'ls -a'
abbr -a ll 'ls -l'
abbr -a la 'ls -la'

fish_add_path $XDG_DATA_HOME/pnpm
fish_add_path $HOME/.local/bin
fish_add_path $XDG_DATA_HOME/cargo/bin
fish_add_path $HOME/.pub-cache/bin
fish_add_path $XDG_DATA_HOME/fvm/default/bin
fish_add_path $XDG_DATA_HOME/go/bin
set PATH node_modules/.bin $PATH
