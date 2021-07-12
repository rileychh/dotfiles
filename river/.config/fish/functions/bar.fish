# Defined in /tmp/fish.KXcYEB/bar.fish @ line 2
function bar
    killall waybar
    # nohup waybar -l trace > ~/.log/waybar.log 2>&1 &
    nohup waybar >~/.log/waybar.log 2>&1 &
end
