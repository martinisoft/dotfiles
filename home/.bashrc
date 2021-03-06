# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

## Color Definitions
# from http://www.linux-magazine.com/Issues/2007/83/PAINT-YOUR-BASH

#Foreground
#1; attribute is bold/light depending on terminal
WHITE="\[\033[1;37m\]"
LGRAY="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
LRED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LGREEN="\[\033[1;32m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
LBLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PINK="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
NORM="\[\033[0m\]"
LCYAN="\[\033[1;36m\]"
#Background
B_BLACK="\[\033[40m\]"
B_RED="\[\033[41m\]"
B_GREEN="\[\033[42m\]"
B_YELLOW="\[\033[43m\]"
B_BLUE="\[\033[44m\]"
B_CYAN="\[\033[46m\]"
B_LGREY="\[\033[47m\]"

## Custom Options

# Set editor to VIM
VISUAL=vim
EDITOR="$VISUAL"

# Enable colors in shell
CLICOLOR=1
# Set dircolor options
# export LSCOLORS=ExFxCxDxBxegedabagacad
# export LSCOLORS=gxgxcxdxbxegedabagacad
LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# less options
LESS="FRX"

# grep options
GREP_OPTIONS="--color"

# Erase duplicates in history
HISTCONTROL=erasedups

# Store 10k history entries
HISTSIZE=10000

# Append the history file when exiting instead of overwriting it
shopt -s histappend

# Ruby Environment Options:

# RI Formatting
RI="--format ansi -T"

# Export all options (in order of appearence)
export PATH VISUAL EDITOR CLICOLOR LSCOLORS LESS GREP_OPTIONS
export HISTCONTROL HISTSIZE
# export RI RUBYOPT GEM_HOME GEM_PATH BUNDLE_PATH CUCUMBER_FORMAT
export RI RUBYOPT CUCUMBER_FORMAT

# Aliases
alias ll='ls -la'
alias gpush='git push'
alias gpull='git pull'
alias gpr='git pull --rebase'

# Custom git status prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

[ -z "$PS1" ] || stty -ixon

[ -z "$PS1" ] || PS1="${GREEN}\h${LGRAY}:${LBLUE}\W${RED}\$(__git_ps1 '(%s)') ${GREEN}\u${NORM}\$ "

if [ -d "$HOME/.cargo/bin" ] ; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# include a local customization
[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"

# load a local bin to PATH if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# added by travis gem
[ -f /Users/martinisoft/.travis/travis.sh ] && source /Users/martinisoft/.travis/travis.sh

complete -C /usr/local/bin/vault vault

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
