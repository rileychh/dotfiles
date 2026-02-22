set fish_greeting
fish_vi_key_bindings

# starship [https://github.com/starship/starship]
starship init fish | source

# zoxide [https://github.com/ajeetdsouza/zoxide]
zoxide init fish | source
abbr -a cd z

# Software preferences
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx DIFFPROG 'nvim -d'
