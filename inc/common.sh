# System Paths.
export PATH=$HOME/bin:$DOTFILES/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

# plenv
eval "$(plenv init -)"

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# goenv
eval "$(goenv init -)"