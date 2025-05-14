function bnoecho
    # Requires extra/tinyxxd
    echo $argv \
        | xxd -b -g0 \
        | awk '{print $2}' \
        | tr -d '\n' \
        | sed 's/1/嗶/g;s/0/啵/g'
    echo
end
