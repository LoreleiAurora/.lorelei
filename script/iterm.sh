set -e

# Setting up iterm2
echo -e "${BLUE}==>${NC} Setting up iterm2"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${DOTFILES}/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
