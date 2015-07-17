# HACK: Force 256 color terminal
uname=`uname`
if [[ $uname = 'Linux' ]]; then
  export TERM="xterm-256color"
fi

# set extra zshell paths
fpath=(
  $fpath
  ~/.rvm/scripts/zsh/Completion
  ~/.zsh/functions
  ~/.zsh/plugins
)

# source the plugins
for plugin in ~/.zsh/plugins/*.zsh; do
  source $plugin
done

# set autocomplete
autoload -U compinit; compinit -i

# history
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# set vi mode
bindkey -v

# shorten the key delay
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# display the current mode
function zle-line-init zle-keymap-select {
  VIM_PROMPT="[% %{$fg[red]%}NORMAL%{$reset_color%}]%"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} %(?.. {%{$fg[red]%}%?%{$reset_color%}})"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# default apps
(( ${+PAGER}   )) || export PAGER='less'
(( ${+EDITOR}  )) || export EDITOR='vim'
export PSQL_EDITOR='vim -c"set syntax=sql"'

# Python virtualenv (via Homebrew)
# source /usr/local/share/python/virtualenvwrapper.sh

# Credit for this awesome git prompt goes to:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{blue}]'
  } else {
    zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{red}●%F{blue}]'
  }

  vcs_info
}

setopt prompt_subst

# colors
autoload -U colors; colors

# prompt
PROMPT=$'%F{blue}%n@%m %c${vcs_info_msg_0_}%F{blue} %(?/%F{blue}/%F{red})%{$reset_color%}%# '

# show non-success exit code in right prompt
RPROMPT=$'%(?..{%{$fg[red]%}%?%{$reset_color%}})'

# load aliases
alias1="$HOME/.bash_aliases"
[[ ! -a $alias1 ]] || source $alias1

# git command
git() {
  # Does .hitch_export_authors exist? Load it!
  [ -f "$HOME/.hitch_export_authors" ] && . "$HOME/.hitch_export_authors"
  # Setup git command
  command git "$@"
}

# exec chefvm
if [ -f "$HOME/.chefvm/bin/chefvm" ] ; then
  eval "$($HOME/.chefvm/bin/chefvm init -)"
fi

# homeshick
if [ -f "$HOME/.homesick/repos/homeshick/homeshick.sh" ] ; then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fi

# hoist homebrew bin higher
if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:$PATH"
fi

# Use NeoVIM
alias vim="nvim"

# Add Chef DK bin to PATH if it exists
if [ -d "$HOME/.chefdk/gem/ruby/2.1.0/bin" ] ; then
  PATH="$HOME/.chefdk/gem/ruby/2.1.0/bin:$PATH"
fi

# Add bin to PATH if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# http://blog.rubygems.org/2013/12/26/2.2.0-released.html
# Commented out due to a bug
# export RUBYGEMS_GEMDEPS="-"
# Make a mini alias wrapper to prevent environment issues for global tools
# alias nobundle="RUBYGEMS_GEMDEPS=''"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/martinisoft/.travis/travis.sh ] && source /Users/martinisoft/.travis/travis.sh
