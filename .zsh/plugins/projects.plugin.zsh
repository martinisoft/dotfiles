pro() { cd ~/projects/$1; }

# Sourced from https://github.com/hashrocket/dotmatrix
pux() {
  local name cols
  if [ -n "$1" ]; then
    pro $1
  fi
  name="$(basename $PWD | sed -e 's/\./-/g')"
  cols="$(tput cols)"
  if ! $(tmux has-session -t $name &>/dev/null); then
    tmux new-session -d -n code -s $name
    tmux new-window -a -d -n server -t $name:1
    tmux new-window -a -d -n console -t $name:2
    tmux select-layout -t $name main-vertical
    tmux send-keys -t $name:1 'vim .' C-m
  fi
  tmux attach -t $name
}

compctl -W ~/projects -/ pro pux
