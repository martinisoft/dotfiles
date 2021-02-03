# This is for anything that is a interactive login shell
# It is evaluated after ~/.zshenv and ~/.zprofile

# Starship for that sweet prompt
eval "$(starship init zsh)"

# Load Homebrew Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi