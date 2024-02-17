function update-mirrors
    sudo true # Ask for password first

    set temp (sudo mktemp)
    rate-mirrors arch | sudo tee $temp

    if test $pipestatus[1] -ne 0
        echo (set_color red)"Failed to update mirrorlist"(set_color normal)
        sudo rm $temp
        return 1
    end

    set mirrorlist /etc/pacman.d/mirrorlist
    sudo mv $mirrorlist $mirrorlist-old
    sudo mv $temp $mirrorlist
    sudo chmod 644 $mirrorlist
end
