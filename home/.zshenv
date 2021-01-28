# This is the earliest ZSH startup file which is evaluated regardless of how
# you invoke ZSH (Login or Interactive).
# Only put things in here that are relative to all invocations of ZSH such as
# aliases and path modifications.

# Configure Rust and friends
export PATH="$HOME/.cargo/bin:$PATH"

# Homeshick Startup
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
