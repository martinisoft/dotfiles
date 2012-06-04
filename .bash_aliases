# vim:set ft=sh sw=2 sts=2 ft=sh:

# Git shortcuts
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit -v'
alias gd='git diff'
alias gdc='git diff --cached'
alias glod='git log --oneline --decorate'
alias gp='git push'
alias gpr='git pull --rebase'
alias gst='git status'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias reset-authors='git commit --amend --reset-author -C HEAD'

# Hitch Gem
alias unhitch='hitch -u'

# Directory listing
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Tmux
alias tmux='tmux -2'

# Misc
alias vi='vim'

# Platform Specific Options
uname=`uname`
# GNU Linux
if [[ $uname = 'Linux' ]]; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
# OSX / FreeBSD
elif [[ $uname = 'FreeBSD' || $uname = 'Darwin' ]]; then
  VISUAL=vim
  EDITOR="$VISUAL"
  LESS="FRX"
  # TODO: Move back to bashrc file
  CLICOLOR=1
  # Set dircolor options
  LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
  PSQL_EDITOR='vim -c"setf sql"'
  export VISUAL EDITOR LESS PSQL_EDITOR CLICOLOR LSCOLORS
fi
