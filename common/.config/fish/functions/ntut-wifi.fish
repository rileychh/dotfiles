function ntut-wifi
    # Dependencies: curl

    set username 111360109
    set password_file ~/doc/ntut-password
    set password (cat $password_file)

    curl 'https://captiveportal-login.ntut.edu.tw/auth/index.html/u' \
        -X POST \
        --data-raw "rr=&username=$username&password=$password&client_login="# &>/dev/null
end
