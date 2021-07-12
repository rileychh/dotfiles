function ll --description 'List contents of directory using long format'
    exa -lbghFm@ --icons --color-scale --group-directories-first --git --time-style=iso $argv
end
