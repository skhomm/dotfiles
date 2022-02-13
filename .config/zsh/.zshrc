###########
# VIMMING #
###########

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor
source "$DOTFILES/zsh/plugins/cursor_mode"

###########
# HISTORY #
###########

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.

###########
# ALIASES #
###########

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ls='ls --color=auto'
alias la='ls -lah'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias vim='nvim'
alias wireshark='open -n -a /Applications/Wireshark.app'
alias env='source env/bin/activate'

##########
# PROMPT #
##########

fpath=($DOTFILES/zsh/prompt $fpath)
source $DOTFILES/zsh/prompt/prompt_purification_setup

##############
# COMPLETION #
##############

source $DOTFILES/zsh/completion.zsh
# autoload -U compinit; compinit
# _comp_options+=(globdots) # With hidden files

###################
# DIRECTORY STACK #
###################

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

#####################
# PRIVATE VARIABLES #
#####################

# Make sure not to add those files to a public repo
source $DOTFILES/.private_envs 2> /dev/null

##########
# PYTHON #
##########

eval "$(pyenv init --path)"

#######################
# SYNTAX HIGHLIGHTING #
#######################

# Source command must be at the end of .zshrc
source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
