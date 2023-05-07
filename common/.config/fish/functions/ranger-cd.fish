# ranger-cd.fish
# author: Seong Yong-ju <sei40kr@gmail.com>
# https://github.com/sei40kr/fish-ranger-cd

function ranger-cd --wraps=ranger --description 'Automatically change the directory in fish after closing ranger'
    set -l tempfile (mktemp -t tmp.XXXXXX)

    ranger --choosedir=$tempfile $argv

    if [ -f $tempfile ]
        cd (cat $tempfile)
    end
    rm -f $tempfile
end
