# Dotfile paths.
export DOTFILES=$HOME/.lorelei
export DOTFILES_INC=$DOTFILES/inc
export ZSH=$DOTFILES/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $DOTFILES_INC/common.sh
source $DOTFILES_INC/prompt.zsh

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
