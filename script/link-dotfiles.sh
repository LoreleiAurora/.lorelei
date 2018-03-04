set -e

# Link dotfiles
echo -e "${BLUE}==>${NC} Linking dotfiles"
ln -sf $DOTFILES/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/.bashrc $HOME/.bashrc
ln -sf $DOTFILES/.bash_profile $HOME/.bash_profile
ln -sf $DOTFILES/.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore_global $HOME/.gitignore_global
