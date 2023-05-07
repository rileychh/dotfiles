function la --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    exa -labghFm --icons --color-scale --group-directories-first --git --time-style=iso $argv
end
