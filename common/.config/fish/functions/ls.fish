function ls --description 'List contents of directory'
    eza -bghFm --icons --color-scale=all --group-directories-first --git --time-style=iso $argv
end
