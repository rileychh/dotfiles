function eza
    set -l index (contains -i -- --color-scale=all $argv)
    if test $index
        set argv[$index] --color-scale
    end
    exa $argv
end
