
# The following lines were added by compinstall

#zstyle ':completion:*' completions 1
#zstyle ':completion:*' glob 1
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
#zstyle ':completion:*' max-errors 2
#zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/mouss/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
#setopt autocd extendedglob nomatch
#unsetopt beep notify
#bindkey -e
# End of lines configured by zsh-newuser-install

if [[ -e /usr/share/zsh/zsh-config ]]; then
	source /usr/share/zsh/zsh-config
fi


PROMPT="%F{#d0d0d0}"$'\U250c'$'\U2500'"[""%f" # some white-ish arrows and brackets
PROMPT+="%F{#11d116}%n%f" # green username
PROMPT+="%F{#ffffff}@%f" # white asterisk
PROMPT+="%F{#33aadd}${${(%):-%m}}%f"  # Arch-blue lue host name
PROMPT+="%F{#d0d0d0}""]""%f"
PROMPT+=" "
PROMPT+="%F{#ffa009}%d %f" # Yellow working directory
# PROMPT+="%F{red}"$'\U0d9e'"%f" # red AMOGUS
PROMPT+=$' '

PROMPT+=$'\n'

PROMPT+="%F{#d0d0d0}"
PROMPT+=$'\U2514'$'\U2500'">"
PROMPT+="%f "


alias hi='startx'
alias bye='pkill -15 -f xserver && pkill -15 -f pulseaudio && pkill -15 -f sddm'
alias pacclean='sudo pacman -R $(pacman -Qdtq)'
alias yayclean='yay -R $(yay -Qdtq)'
alias grep='grep --line-number --color'
alias takeoff='sudo rfkill block all'
alias land='sudo rfkill unblock all'
alias ip='ip --color'
alias shu='poweroff'
alias reb='reboot'
# Alias to run pyfda with legible text
alias pyfda()
{ 
	plasma-apply-colorscheme BreezeLight;
	pyfdax;
	plasma-apply-colorscheme SweetAmbarBlue;
}
