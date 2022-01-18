# This is the earliest ZSH startup file which is evaluated regardless of how
# you invoke ZSH (Login or Interactive).
# Only put things in here that are relative to all invocations of ZSH such as
# aliases and path modifications.

# Check if this is ZSH version 4.0 or above
function is4 () {
    [[ $ZSH_VERSION == <4->* ]] && return 0
    return 1
}

# Configure Rust and friends
if test -d ~/.cargo/bin; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Homeshick Startup
if test -d ~/.homesick; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fi

# Aliases
alias vi='nvim'
alias vim='nvim'

alias gitclean='git branch --merged | grep -v "\*" | grep -v "main" | xargs -n 1 git branch -d'
alias gc='git commit -v'
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gap='git add -p'
alias gpr='git pull --rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gst='git status -sb'

alias be='bundle exec'

# Configure FZF
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!.git/*'"

# append history list to the history file; this is the default but we make sure
# because it's required for share_history.
setopt append_history

# import new commands from the history file also in other zsh-session
is4 && setopt share_history

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list
is4 && setopt histignorealldups

# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace

# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob
