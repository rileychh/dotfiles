function la --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    eza -labghFm --icons --color-scale=all --group-directories-first --git --time-style=iso $argv
end
