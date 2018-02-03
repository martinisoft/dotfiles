set -g -x PATH ~/bin $PATH
set -g -x PATH /usr/local/bin $PATH
set -g -x fish_greeting ''
set -x EDITOR nvim
set -x GOPATH ~/.go
set -g -x PATH ~/.go/bin $PATH
source "$HOME/.homesick/repos/homeshick/homeshick.fish"

alias vi "vim"
alias vim "nvim"
alias gitclean 'git branch --merged master | grep -v " master" | grep -v "\*" | xargs -n 1 git branch -d'
alias gitprune 'git remote prune origin'

abbr -a gc git commit -v
abbr -a gp git push
abbr -a gd git diff
abbr -a gdc git diff --cached
abbr -a gap git add -p
abbr -a gpr git pull --rebase
abbr -a gra git rebase --abort
abbr -a grc git rebase --continue
abbr -a gst git status -sb
abbr -a be bundle exec
abbr -a ce chef exec

fish_vi_key_bindings

function fish_mode_prompt --description 'Displays the current mode'
    switch $fish_bind_mode
        case default
            set_color --bold --background red white
            echo '[N]'
        case insert
            set_color --bold --background green white
            echo '[I]'
        case visual
            set_color --bold --background magenta white
            echo '[V]'
    end
    set_color normal
    echo -n ' '
end

test -e {$HOME}/.fish.local ; and source {$HOME}/.fish.local