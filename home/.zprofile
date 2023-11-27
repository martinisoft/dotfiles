# Run Homebrew Startup when available
if test -d /opt/homebrew/bin; then
    # export PATH="/opt/homebrew/bin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

