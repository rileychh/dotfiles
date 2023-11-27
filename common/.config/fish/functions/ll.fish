function ll --description 'List contents of directory using long format'
    eza -lbghFm --icons --color-scale=all --group-directories-first --git --time-style=iso $argv
end
