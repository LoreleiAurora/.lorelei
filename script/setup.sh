set -e

INCLUDE_SCRIPTS=(
  system
  homebrew
  link-dotfiles
  iterm
  zsh
)

for i in "${INCLUDE_SCRIPTS[@]}"
do
  source ${DOTFILES}/script/${i}.sh
done

source $DOTFILES/inc/common.sh

INCLUDE_SCRIPTS=(
  ruby
  python
  node
  php
)

for i in "${INCLUDE_SCRIPTS[@]}"
do
  source ${DOTFILES}/script/${i}.sh
done

unset INCLUDE_SCRIPTS
