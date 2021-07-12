function ls --description 'List contents of directory'
    exa -bghFm@ --icons --color-scale --group-directories-first --git --time-style=iso $argv
end
