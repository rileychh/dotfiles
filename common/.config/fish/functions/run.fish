function run
    set file $argv[1]
    set ext (string match --regex '\.[^.]*$' $file)
    set output $XDG_CACHE_HOME/fish/run/a.out
    switch $ext
        case .c
            gcc -o $output $file
            and $output
        case .cpp .cc .C
            g++ -o $output $file
            and $output
        case .rs
            rustc -o $output $file
            and $output
        case .py
            python $file
        case .sh
            sh $file
    end
end
