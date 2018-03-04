set -e

# Install Homebrew
export GIT_DIR="/usr/local/Homebrew/.git" GIT_WORK_TREE="/usr/local/Homebrew"
if [ -d "/usr/local/Homebrew" ]
  then
  git fetch -q
else
  set_sudo
  echo -e "${BLUE}==>${NC} Installing Homebrew"
  for DIR in Cellar Frameworks Homebrew bin etc include lib opt sbin share var
    do
    sudo mkdir -p "/usr/local/${DIR}"
    sudo chown -R "$USER:admin" "/usr/local/${DIR}"
  done
  unset DIR
  ln -sf /usr/local/Homebrew/bin/brew /usr/local/bin/brew
  git init -q
  git config remote.origin.url "https://github.com/Homebrew/brew"
  git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git fetch -q --no-tags --depth=1 --force --update-shallow
fi
git reset -q --hard origin/master
unset GIT_DIR GIT_WORK_TREE

# Install homebrew packages.
echo -e "${BLUE}==>${NC} Installing packages with homebrew"
pushd $DOTFILES &> /dev/null
  brew bundle
popd

# Updating homebrew packages.
echo -e "${BLUE}==>${NC} Updating packages with homebrew"
brew update
brew outdated
brew upgrade
brew cleanup
