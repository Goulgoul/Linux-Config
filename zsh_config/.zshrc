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

PROMPT="%F{#d0d0d0}"$'\U250c'$'\U2500'$'\U2500'"(""%F{#11d116}%n%F{#ffffff}@%F{#33aadd}%m%F{#d0d0d0})"$'\U2500'$'\U2500'"(%F{#ffa009}%d%F{#d0d0d0})"$'\n'$'\U2514'$'\U2500'"> %f"


source ~/.zsh-config
# if [ -x "$(command -v tmux)" ] && [ -z "${TMUX}" ]; then
#     exec tmux new-session -A -s ${USER} >/dev/null 2>&1
# fi
source ~/.zsh-aliases

eval "$(zoxide init zsh)"
