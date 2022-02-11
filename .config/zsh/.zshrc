bindkey -v
export KEYTIMEOUT=1

# HISTORY

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.

# ALIASES

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
