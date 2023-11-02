# zsh config file - hard-linked to ~/git/linuxconfig to be saved online
# PROMPT configuration
# """
# # PROMPT="" # some white-ish arrows and brackets
# PROMPT="%F{#d0d0d0}"$'\U250c'$'\U2500'"[""%f" # some white-ish arrows and brackets
# PROMPT+="%F{#11d116}%n%f" # green username
# PROMPT+="%F{#ffffff}@%f" # white asterisk
# PROMPT+="%F{#33aadd}${${(%):-%m}}%f"  # Arch-blue lue host name
# PROMPT+="%F{#d0d0d0}""]""%f"
# PROMPT+=" "
# PROMPT+="%F{#ffa009}%d %f" # Yellow working directory
#
# # PROMPT+="%F{red}"$'\U0d9e'"%f" # red AMOGUS
# PROMPT+=$' '
#
# PROMPT+=$'\n'
#
# PROMPT+="%F{#d0d0d0}"
# PROMPT+=$'\U2514'$'\U2500'">"
# PROMPT+="%f "

PROMPT="%F{#d0d0d0}"$'\U250c'$'\U2500'$'\U2500'"(""%F{#11d116}%n%F{#ffffff}@%F{#33aadd}${(%):-%m}%F{#d0d0d0})"$'\U2500'$'\U2500'"(%F{#ffa009}%d%F{#d0d0d0})"$'\n'$'\U2514'$'\U2500'"> %f"

source ~/.zsh-config

# xserver related aliases
alias hi='/home/mouss/.hi.sh'
alias bye='(pkill -15 -f wayland || pkill -15 -f xserver) && pkill -15 -f pulseaudio && pkill -15 -f sddm'

# pacman and yay related aliases
alias pacclean='sudo pacman -R $(pacman -Qdtq)'
alias yayclean='yay -R $(yay -Qdtq)'

# common commands aliases
alias grep='grep --line-number --color'
alias ls='\ls --color'
alias fls='ls -lah --color'
mkcd () {
  mkdir "$1" && cd "$1"
}
alias ip='ip --color'
alias cp='cp -r -v'

# aeroplane mode aliases
alias takeoff='rfkill block all'
alias land='rfkill unblock all'

# bluetooth aliases
alias blon='bluetoothctl power on'
alias bloff='bluetoothctl power off'
alias bllist='bluetoothctl devices'
alias blpair='bluetoothctl pair'
alias blconnect='bluetoothctl connect'
alias bldisconnect='bluetoothctl disconnect'
alias blscan='bluetoothctl scan on'

# power management aliases
alias shu='poweroff'
alias reb='reboot'
alias hib='systemctl hibernate'
alias acf='auto-cpufreq'
# PlatformIO aliases
alias piobuild='pio run --target build --environment'
alias pioupload='pio run --target upload --environment'
alias piomonitor='pio run --target monitor --environment'

# NetworkManager CLI shortcuts
alias nmlist='nmcli d w l'
alias nmrescan='nmcli d w l --rescan yes'
alias nmconnect='nmcli d w c'




# Docker initialisation script
alias dockerstart='sudo ~/.docker_start.sh'
alias dockerstop='sudo ~/.docker_stop.sh'



# Github aliases
alias quickpush='git add . && git status && git commit -m "quick push" && git push'

# neofetch
alias nf='neofetch'
# un jour je ferai marcher pyfda mais pour l'instant ça me saoule mdr
# Alias to run pyfda with legible text
#alias pyfda() { 
#	plasma-apply-colorscheme BreezeLight;
#	pyfdax;
#	plasma-apply-colorscheme SweetAmbarBlue;
#}
alias pf='pfetch'


