#!/bin/sh

# Use the "logo" key as the primary modifier
mod="Mod4"

riverctl map normal $mod Return spawn alacritty
riverctl map normal $mod Grave spawn wofi --show drun,run
riverctl map normal $mod PrintScreen spawn sh -c 'grim -g $(slurp) - | wl-copy'

riverctl map normal $mod+Shift W close # Close the focused view
riverctl map normal $mod+Control W exit # Exit river

# Mod+J and Mod+K to focus the next/previous view in the layout stack
riverctl map normal $mod J focus-view next
riverctl map normal $mod K focus-view previous

# Swap the focused view with the next/previous view in the layout stack
riverctl map normal $mod+Shift J swap next
riverctl map normal $mod+Shift K swap previous

# Focus the next/previous output
riverctl map normal $mod Period focus-output next
riverctl map normal $mod Comma focus-output previous

# Send the focused view to the next/previous output
riverctl map normal $mod+Shift Period send-to-output next
riverctl map normal $mod+Shift Comma send-to-output previous

# Bump the focused view to the top of the layout stack, making it the new master
riverctl map normal $mod+Shift Return zoom

# Decrease/increase the width of the master column by 5%
riverctl map normal $mod H mod-main-factor -0.05
riverctl map normal $mod L mod-main-factor +0.05

# Increment/decrement the number of master views in the layout
riverctl map normal $mod+Shift H mod-main-count -1
riverctl map normal $mod+Shift L mod-main-count +1

# Move views
riverctl map normal $mod+Mod1 H move left 100
riverctl map normal $mod+Mod1 J move down 100
riverctl map normal $mod+Mod1 K move up 100
riverctl map normal $mod+Mod1 L move right 100

# Resize views
riverctl map normal $mod+Mod1+Shift H resize horizontal -100
riverctl map normal $mod+Mod1+Shift J resize vertical 100
riverctl map normal $mod+Mod1+Shift K resize vertical -100
riverctl map normal $mod+Mod1+Shift L resize horizontal 100

# Snap views to screen edges
riverctl map normal $mod+Mod1+Control H snap left
riverctl map normal $mod+Mod1+Control J snap down
riverctl map normal $mod+Mod1+Control K snap up
riverctl map normal $mod+Mod1+Control L snap right

# Move views
riverctl map-pointer normal $mod BTN_LEFT move-view

# Resize views
riverctl map-pointer normal $mod BTN_RIGHT resize-view

for i in $(seq 1 9)
do
    tagmask=$((1 << ($i - 1)))

    # Mod+[1-9] to focus tag [0-8]
    riverctl map normal $mod $i set-focused-tags $tagmask

    # Mod+Shift+[1-9] to tag focused view with tag [0-8]
    riverctl map normal $mod+Shift $i set-view-tags $tagmask

    # Mod+Ctrl+[1-9] to toggle focus of tag [0-8]
    riverctl map normal $mod+Control $i toggle-focused-tags $tagmask

    # Mod+Shift+Ctrl+[1-9] to toggle tag [0-8] of focused view
    riverctl map normal $mod+Shift+Control $i toggle-view-tags $tagmask
done

# Mod+0 to focus all tags
# Mod+Shift+0 to tag focused view with all tags
all_tags_mask=$(((1 << 32) - 1))
riverctl map normal $mod 0 set-focused-tags $all_tags_mask
riverctl map normal $mod+Shift 0 set-view-tags $all_tags_mask

# Toggle float
riverctl map normal $mod Space toggle-float

# Toggle fullscreen
riverctl map normal $mod F toggle-fullscreen

# Change master orientation
riverctl map normal $mod Up layout rivertile top
riverctl map normal $mod Right layout rivertile right
riverctl map normal $mod Down layout rivertile down
riverctl map normal $mod Left layout rivertile left

# Change to Full layout
riverctl map normal $mod S layout full

# Various media key mapping examples for both normal and locked mode which do not have a modifier
for mode in normal locked
do
    # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
    # Control screen backlight brighness with light (https://github.com/haikarainen/light)
    # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
    riverctl map $mode None XF86AudioMute         spawn pamixer --toggle-mute # F1
    riverctl map $mode None XF86AudioLowerVolume  spawn pamixer --decrease 5 # F2
    riverctl map $mode None XF86AudioRaiseVolume  spawn pamixer --increase 5 # F3
    riverctl map $mode None XF86AudioMicMute      spawn pamixer --default-source --toggle-mute # F4
    riverctl map $mode None XF86MonBrightnessDown spawn sudo light -U 5 # F5
    riverctl map $mode None XF86MonBrightnessUp   spawn sudo light -A 5 # F6
    # riverctl map $mode None XF86Display   # F7
    # riverctl map $mode None XF86WLAN      # F8
    # riverctl map $mode None XF86Favorites # F12
done

# Set repeat rate
riverctl set-repeat 50 300

# Set the layout on startup
riverctl layout rivertile left

# Set app-ids of views which should float
riverctl float-filter-add "float"
riverctl float-filter-add "popup"

# Set app-ids of views which should use client side decorations
riverctl csd-filter-add "gedit"

# Set opacity and fade effect
riverctl opacity 1.0 1.0 0.75 0.001 1

# Set colors, borders and gaps
riverctl border-color-focused "#458588"
riverctl border-color-unfocused "#00000000"
riverctl border-width 2
riverctl view-padding 2
riverctl outer-padding 2

riverctl spawn waybar > ~/.log/waybar.log 2>&1
# riverctl spawn swaybg -i "$XDG_CONFIG_HOME/bg.jpg"
riverctl spawn oguri
riverctl spawn dwall -s home
riverctl spawn nextcloud --logfile ~/.log/nextcloud.log
riverctl spawn /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
riverctl spawn dex --autostart
riverctl spawn ibus-daemon -drx
riverctl spawn thunar --daemon
