function adbw
    set ip 192.168.8.9
    set port (nmap $ip -p 37000-47000 | awk "/\/tcp/" | cut -d/ -f1)
    adb connect $ip:$port
end
