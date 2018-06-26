set -e

INCLUDE_SCRIPTS=(
  system
  homebrew
  link-dotfiles
  desk
  iterm
  zsh
)

for i in "${INCLUDE_SCRIPTS[@]}"
do
  source ${DOTFILES}/script/${i}.sh
done

source $DOTFILES/inc/common.sh

unset INCLUDE_SCRIPTS
