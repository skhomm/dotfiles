For a new system:
```
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
alias conf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/skhomm/dotfiles.git $HOME/.dotfiles
conf checkout
conf config --local status.showUntrackedFiles no
conf config --local user.name "skhomm"
conf config --local user.email skhommy@gmail.com
```

Useful links:
https://thevaluable.dev/zsh-install-configure-mouseless/
https://www.atlassian.com/git/tutorials/dotfiles
