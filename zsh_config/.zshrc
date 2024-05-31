# zsh config file - hard-linked to ~/git/linuxconfig to be saved online
# PROMPT configuration

PROMPT="%F{#d0d0d0}"$'\U250c'$'\U2500'$'\U2500'"(""%F{#11d116}%n%F{#ffffff}@%F{#33aadd}%m%F{#d0d0d0})"$'\U2500'$'\U2500'"(%F{#ffa009}%d%F{#d0d0d0})"$'\n'$'\U2514'$'\U2500'"> %f"


source ~/.zsh-config
# if [ -x "$(command -v tmux)" ] && [ -z "${TMUX}" ]; then
#     exec tmux new-session -A -s ${USER} >/dev/null 2>&1
# fi
source ~/.zsh-aliases

eval "$(zoxide init zsh)"
