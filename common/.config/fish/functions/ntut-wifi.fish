function ntut-wifi
    # Dependencies: bw (Bitwarden CLI), curl

    set bw_session_path ~/.cache/bw_session
    set bw_email chengxuanjhe@gmail.com
    set bw_item_name 校園入口網站

    if test -e $bw_session_path
        # Check if the session is still valid
        set bw_session (cat $bw_session_path)
        if not bw sync --session $bw_session &>/dev/null
            set bw_session (login_and_get_session; or return 1)
        end
    else
        # Session file not found
        set bw_session (login_and_get_session; or return 1)
    end

    echo $bw_session >$bw_session_path
    chmod 600 $bw_session_path

    set username (bw get username $bw_item_name --session $bw_session)
    set password (bw get password $bw_item_name --session $bw_session)

    curl 'https://captiveportal-login.ntut.edu.tw/auth/index.html/u' \
        -X POST \
        --data-raw "rr=&username=$username&password=$password&client_login=" &>/dev/null
end

function login_and_get_session
    if bw login --check &>/dev/null
        # Logout if already logged in to get a new session
        bw logout &>/dev/null
    end

    set bw_session (bw login $bw_email --raw; or return 1)
    echo $bw_session
end
