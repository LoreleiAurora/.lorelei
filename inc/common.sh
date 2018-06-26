# System Paths.
export PATH=$HOME/bin:$DOTFILES/bin:/usr/local/opt/curl/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/man:$MANPATH"

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

# The Fuck
eval $(thefuck --alias)