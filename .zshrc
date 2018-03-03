# Dotfile paths.
export DOTFILES=$HOME/.lorelei
export ZSH=$DOTFILES/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# System Paths.
export PATH=$HOME/bin:$DOTFILES/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set ZSH theme
ZSH_THEME="bullet-train"

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

# oh-my-zsh
DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="dd/mm/yyyy"

plugins=(
  brew
  bundler
  common-aliases
  composer
  desk
  docker
  docker-compose
  gem
  git
  gnu-utils
  lol
  npm
  rsync
  ruby
  terraform
  thefuck
  vagrant
  zsh-iterm-touchbar
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
