function ls --description 'List contents of directory'
    if command --query eza
        eza -bghFm --icons --color-scale=all --group-directories-first --git --time-style=iso $argv
    else
        exa -bghFm --icons --color-scale --group-directories-first --git --time-style=iso $argv
    end
end
