# To use twitter/discord emoji as local emoji font :

1.  Download aur/ttf-twemoji
2.  cd /etc/fonts/conf.d
3.  ln -s /usr/share/fontconfig/conf.avail/75-twemoji.conf
> Things shoud work fine
4.  To enable hibernation: 
    - set swap volume ID in /etc/default/grub ("resume=UUID=foobar") and run grub-mkconfig command with relevant parameters (in my case, `sudo grub-mkconfig -o /boot/grub/grub.cfg`)
    - add "resume" hook in /etc/mkinitcpio.conf after udev or lvm2
    - mkinitcpio with relevant options
    - systemcteml hibernate
