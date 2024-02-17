function ls --description 'List contents of directory'
    if command --query eza
        eza -bghmF --icons --color-scale=all --group-directories-first --git --time-style=iso $argv
    else
        exa -bghmF --icons --color-scale --group-directories-first --git --time-style=iso $argv
    end
end
