function update-mirrors
	set mirrorlist /etc/pacman.d/mirrorlist
	set temp (mktemp)
	sudo true # Ask for password first
	rate-mirrors arch | tee $temp
	and sudo mv $mirrorlist $mirrorlist-old
	and sudo mv $temp $mirrorlist
end
