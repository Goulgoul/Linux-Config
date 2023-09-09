#read -s -p "1) KDE Plasma (Wayland)"$'\n'"2) KDE Plasma (Xorg)"$'\n' -n 1 INPUT


#case $INPUT in
#1 | '&')
#	startplasma-wayland;;
#2 | 'é')
#	startx ~/.config/X11/xinitrc-kde;;
#*)
#	startplasma-wayland;;
#esac

startplasma-wayland
