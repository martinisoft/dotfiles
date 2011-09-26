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

# Update PATH with additional user-created directories
PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
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

# RUBYOPT (Ruby Execution Options)
# RUBYOPT="rubygems"

# Brewbygems!
# GEM_HOME="$(brew --prefix)/Cellar/gems/1.9"
# GEM_PATH="$(brew --prefix)/Cellar/gems/1.9"
# Bundles
# BUNDLE_PATH=$GEM_HOME

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

alias vanguard="guard -c -n false"
alias vangaurd="vanguard"

# Custom git status prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
function minutes_since_last_commit {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}
git_status_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
    if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
      local COLOR=${RED}
    elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
      local COLOR=${YELLOW}
    else
      local COLOR=${GREEN}
    fi
    local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORM}"
    local GIT_PROMPT="(${SINCE_LAST_COMMIT}|${LRED}$(__git_ps1)${GREEN})"
    echo "$GIT_PROMPT"
  else
    GIT_PROMPT=""
  fi
}
# HACK: Need to figure out why echo does not respect my escapes :(
git_minutes_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local MINUTES_SINCE_LAST_COMMIT="$(minutes_since_last_commit)m"
    local GIT_PROMPT=`__git_ps1 "(${MINUTES_SINCE_LAST_COMMIT}|%s)"`
    echo $GIT_PROMPT
  fi
}

# git bash shell script
source ~/.git-completion.bash

[ -z "$PS1" ] || stty -ixon

# [ -z "$PS1" ] || PS1="\h:\W\$(git_status_prompt) \u\$ "
# [ -z "$PS1" ] || PS1="${GREEN}\h:\W${RED}\$(git_minutes_prompt) ${GREEN}\u${NORM}\$ "
[ -z "$PS1" ] || PS1="${GREEN}\h${LGRAY}:${LBLUE}\W${RED}\$(__git_ps1 '(%s)') ${GREEN}\u${NORM}\$ "

# include a local customization
[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# RVM Autocomplete
[[ -r "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion"

