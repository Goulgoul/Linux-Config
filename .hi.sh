read -s -p "1) KDE Plasma"$'\n'"2) awesome"$'\n' -n 1 INPUT


case $INPUT in
1)
	startx ~/.config/X11/xinitrc-kde;;
'&')
	startx ~/.config/X11/xinitrc-kde;;
2)
	startx ~/.config/X11/xinitrc-awesome;;  
'é')
	startx ~/.config/X11/xinitrc-awesome;;
esac
