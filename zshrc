zstyle :compinstall filename '/home/corin/.zshrc'

EDITOR=vim
GIT_SSL_NO_VERIFY=1
HISTFILE=~/.histfile
HISTSIZE=1000
PATH=$HOME/.rbenv/bin:$HOME/Bin/:$HOME/Code/RT/rt/bin:$PATH
SAVEHIST=1000
TERM=screen-256color
XDG_CONFIG_HOME=$HOME/.config
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export EDITOR
export TERM
export GIT_SSL_NO_VERIFY

setopt appendhistory
setopt nomatch
setopt NO_BEEP
setopt AUTO_LIST
setopt AUTO_MENU

bindkey -e

autoload -Uz compinit promptinit
compinit
promptinit

prompt redhat

case $TERM in
  *screen*)
    precmd () {print -Pn "\e]0;%n@%M: %~\a"}
  ;;
esac

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

eval "$(rbenv init -)"

source $HOME/.aliases
