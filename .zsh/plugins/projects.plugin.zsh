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
    tmux new-session -d -n code -s $name -x${cols-150} -y50
    tmux split-window -t $name:0
    tmux new-window -a -d -n server -t $name:0
    tmux new-window -a -d -n console -t $name:1
    tmux select-layout -t $name main-vertical
    tmux send-keys -t $name:0.1 'vim .' C-m
  fi
  tmux attach -t $name
}

compctl -W ~/projects -/ pro pux
