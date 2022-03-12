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

HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
# setopt SHARE_HISTORY

###########
# ALIASES #
###########

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ls='ls --color=auto'
alias la='ls -lah'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias wireshark='open -n -a /Applications/Wireshark.app'
alias env='source env/bin/activate'

alias gs='git status'
alias gd='git diff'
alias gl='git log'

# Check if nvim is installed before aliasing it to vim
if command -v nvim &> /dev/null; then
    alias vim='nvim'
else
    echo "nvim not installed"
fi

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
for index ({0..9}) alias "$index"="cd +${index}"; unset index

#####################
# PRIVATE VARIABLES #
#####################

# Make sure not to add those files to a public repo
source $DOTFILES/.private_envs 2> /dev/null

##########
# PYTHON #
##########

if command -v pyenv &> /dev/null; then
    eval "$(pyenv init --path)"
else
    echo "pyenv not installed"
fi

#######################
# SYNTAX HIGHLIGHTING #
#######################

# Source command must be at the end of .zshrc
source $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
