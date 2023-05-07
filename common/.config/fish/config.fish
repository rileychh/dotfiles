set fish_greeting
fish_vi_key_bindings

# starship [https://github.com/starship/starship]
starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/cheng/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

abbr -a se 'systemctl enable'
abbr -a s systemctl
abbr -a sen 'systemctl enable --now'
abbr -a dot 'git --git-dir=/home/cheng/.git --work-tree=/home/cheng'
abbr -a cp 'rsync -ah --info=progress2'
abbr -a ss 'systemctl status'
abbr -a sr 'systemctl restart'
abbr -a d docker
abbr -a dc 'docker compose'
