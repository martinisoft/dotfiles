# This is for anything that is a interactive login shell
# It is evaluated after ~/.zshenv and ~/.zprofile

# direnv hook
eval "$(direnv hook zsh)"

# Starship for that sweet prompt
eval "$(starship init zsh)"

# Load Homebrew Completions and add sbin to PATH
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Load custom functions ahead of everything else
if test -d ~/.config/zsh/functions; then
  if test -n $(ls -A ~/.config/zsh/functions); then
    fpath=(~/.config/zsh/functions $fpath)
    autoload -U $fpath[1]/*(:t)
  fi
fi

# Replace ctrl+r with McFly
if type mcfly &>/dev/null; then
  eval "$(mcfly init zsh)"
  # Turn on Fuzzy Searching mode
  export MCFLY_FUZZY=true
  # Enable VIM key bindings
  # export MCFLY_KEY_SCHEME=vim
fi
