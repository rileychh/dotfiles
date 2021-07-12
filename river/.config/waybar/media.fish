#!/usr/bin/env fish

switch $argv[1]
    case toggle
        playerctl play-pause
    case waybar
        set player (playerctl --list-all)[1]
        set text (timeout 2 playerctl metadata title; or echo $player)
        set tooltip (echo "Playing" (timeout 2 playerctl metadata --format='{{ artist }} - {{ title }}') "via $player")
        set percentage 100

        switch $player
            case spotify spotifyd
                set icon 
            case 'firefox*'
                set icon 
            case 'chromium*'
                set icon 
            case '*'
                set icon 
        end

        if test (playerctl status) != Playing
            set -e text
            set -e icon
            set tooltip "Not playing"
        end

        echo "\
{
    \"text\": \"$icon $text\",
    \"alt\": \"$player\",
    \"tooltip\": \"$tooltip\",
    \"class\": \"$player\",
    \"percentage\": $percentage
}"\
 | jq --unbuffered --compact-output
end

# vi: sw=4
