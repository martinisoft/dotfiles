# Run Homebrew Startup when available
if test -d /opt/homebrew/bin; then
    # export PATH="/opt/homebrew/bin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
