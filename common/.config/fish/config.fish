set fish_greeting
fish_vi_key_bindings

# starship [https://github.com/starship/starship]
starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/cheng/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end