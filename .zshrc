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

# default apps
(( ${+PAGER}   )) || export PAGER='less'
(( ${+EDITOR}  )) || export EDITOR='vim'
export PSQL_EDITOR='vim -c"set syntax=sql"'

# vcs
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
PROMPT=$'%F{blue}%n@%m %c${vcs_info_msg_0_}%F{blue} %(?/%F{blue}/%F{red})%% %{$reset_color%}'

# show non-success exit code in right prompt
RPROMPT=$'%(?..{%{$fg[red]%}%?%{$reset_color%}})'

# load aliases
alias1="$HOME/.bash_aliases"
[[ ! -a $alias1 ]] || source $alias1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting