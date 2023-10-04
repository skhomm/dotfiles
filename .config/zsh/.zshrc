###########
# Startup #
###########

# Check if there are any diffs in config against last commit
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff

print "
Use <conf> to track changes in your .dotfiles:
conf [diff] [status] [add] [commit] [push] [log]

aliases:
<confe> = edit zshrc
<confu> = conf commit -am

Use <conf push> to push changes to github
"

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
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

###########
# ALIASES #
###########

alias conf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias confu='conf commit -am '\"'Update config'\"
alias confe='vim $HOME/.config/zsh/.zshrc'

alias tma='tmux a'

alias ls='ls --color=auto'
alias la='ls -lah'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias wireshark='open -n -a /Applications/Wireshark.app'
alias ipl='ipython'
alias venv='source env/bin/activate'

alias gs='git status'
alias gd='git diff'
alias gl='git log'

alias ap='ansible-playbook'

alias b='cd -'
alias bd='cd ..'

alias sshi='ssh -o IdentitiesOnly=yes -i'
alias sshpass='ssh -o PreferredAuthentications=keyboard-interactive,password,publickey'
alias scpi='scp -o IdentitiesOnly=yes -i'
alias scppass='scp -o PreferredAuthentications=keyboard-interactive,password,publickey'

alias ec='echo $?'

alias yfi='python3 ~/projects/yfitool/yfitool.py'

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

##########
# PYTHON #
##########

if command -v pyenv &> /dev/null; then
    eval "$(pyenv init --path)"
else
    echo "pyenv not installed"
fi

########
# PATH #
########

PATH=$PATH:/usr/local/sbin

##################
# PRIVATE CONFIG #
##################

# Make sure not to add those files to a public repo
source $DOTFILES/.private_envs 2> /dev/null
source $DOTFILES/zsh/.private_config 2> /dev/null

#######################
# SYNTAX HIGHLIGHTING #
#######################

# Source command must be at the end of .zshrc
source $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
