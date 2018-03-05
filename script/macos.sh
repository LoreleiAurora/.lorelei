set -e

# Disable the desktop
defaults write com.apple.finder CreateDesktop -bool FALSE

killall Finder
