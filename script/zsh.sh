set -e

# Setup ZSH
if [ "$SHELL" != "/usr/local/bin/zsh" ]; then
  echo -e "${BLUE}==>${NC} Changing shell to ZSH"
  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
fi
