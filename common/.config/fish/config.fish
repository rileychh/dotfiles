set fish_greeting
fish_vi_key_bindings

# starship [https://github.com/starship/starship]
starship init fish | source

# Software preferences
set -gx BROWSER firefox
set -gx MOZ_ENABLE_WAYLAND 1
set -gx EDITOR nvim
set -gx VISUAL nvim

# pnpm
set -gx PNPM_HOME "/home/cheng/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# Flutter
set -gx CHROME_EXECUTABLE /usr/bin/chromium
set -gx PUB_CACHE /home/cheng/.cache/pub

# Disable history
set -gx HISTFILE /home/cheng/.local/share/bash/history
set -gx LESSHISTFILE "-"

# Keep the home directory clean
set -gx CARGO_HOME /home/cheng/.local/share/cargo
set -gx CCACHE_CONFIGPATH /home/cheng/.config/ccache.conf
set -gx CCACHE_DIR /home/cheng/.cache/ccache
set -gx GNUPGHOME /home/cheng/.local/share/gnupg
set -gx NODE_REPL_HISTORY /home/cheng/.local/share/node_repl_history
set -gx NPM_CONFIG_USERCONFIG /home/cheng/.config/npm/npmrc
set -gx PYTHONSTARTUP /home/cheng/.config/python/startup.py
set -gx RUSTUP_HOME /home/cheng/.local/share/rustup
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=/home/cheng/.config/java"

set -gx XDG_CACHE_HOME /home/cheng/.cache
set -gx XDG_CONFIG_HOME /home/cheng/.config
set -gx XDG_DATA_HOME /home/cheng/.local/share

# Abbreviations
abbr -a s systemctl
abbr -a ss 'systemctl status'
abbr -a se 'systemctl enable'
abbr -a sen 'systemctl enable --now'
abbr -a sr 'systemctl restart'
abbr -a cp 'rsync -ah --info=progress2'
abbr -a d docker
abbr -a dc 'docker compose'
abbr -a r ranger-cd
abbr -a vi nvim

fish_add_path $HOME/.local/share/pnpm
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/cargo/bin
fish_add_path $HOME/.pub-cache/bin
fish_add_path /usr/lib/jvm/java-19-openjdk/bin/
fish_add_path /opt/android-sdk/cmdline-tools/latest/bin
fish_add_path /opt/flutter/bin
set PATH node_modules/.bin $PATH
