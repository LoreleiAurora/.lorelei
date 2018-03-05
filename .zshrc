# Dotfile paths.
export DOTFILES=$HOME/.lorelei
export DOTFILES_INC=$DOTFILES/inc
export ZSH=$DOTFILES/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit

# Changing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

source $DOTFILES_INC/common.sh
source $DOTFILES_INC/aliases.sh
source $DOTFILES_INC/prompt.zsh

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
