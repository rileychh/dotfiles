function chglim
    # Dependencies: tpacpi-bat 

    # 1 for main, 2 for secondary, or 0 for either/both
    set bat 1

    if test (count $argv) -eq 0
        set limit (sudo tpacpi-bat -g stopThreshold $bat | awk '{print $1}')
        echo "Current charge limit is $limit"

    else if test (count $argv) -eq 1
        set limit $argv[1]

        if test $limit -lt 0; or test $limit -gt 99
            echo "Invalid charge limit. Please provide a number between 0-99"
            return 1
        end

        sudo tpacpi-bat -s startThreshold $bat $limit
        sudo tpacpi-bat -s stopThreshold $bat $limit
        echo "\
BATTERY=\"$bat\"
START_THRESHOLD=\"$limit\"
STOP_THRESHOLD=\"$limit\"
        " | sudo tee /etc/conf.d/tpacpi >/dev/null
        if test $limit -eq 0
            echo "Turned off charge limit."
        else
            echo "Charge limit set to $limit%."
        end

    else
        echo "Usage: chglim [limit]"
        echo "  limit (optional): The new charge limit (a percentage value)"
    end
end
