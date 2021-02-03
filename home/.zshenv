# This is the earliest ZSH startup file which is evaluated regardless of how
# you invoke ZSH (Login or Interactive).
# Only put things in here that are relative to all invocations of ZSH such as
# aliases and path modifications.

# Configure Rust and friends
export PATH="$HOME/.cargo/bin:$PATH"

# Homeshick Startup
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Aliases
alias vi='nvim'
alias vim='nvim'

alias gitclean='git branch --merged master | grep -v " master" | grep -v "\*" | xargs -n 1 git branch -d'
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
