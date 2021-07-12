# Defined in /tmp/fish.Yepp3U/wifi.fish @ line 2
function wifi
    sudo ip link set wlan0 down
    sudo ip link set wlan0 up
    sleep 3
    iwctl station wlan0 scan
end
