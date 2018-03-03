# Dotfile paths.
export DOTFILES=$HOME/.lorelei
export DOTFILES_INC=$DOTFILES/inc
export ZSH=$DOTFILES/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set ZSH theme
ZSH_THEME="bullet-train"

source $DOTFILES_INC/common.sh

# oh-my-zsh
DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="dd/mm/yyyy"

plugins=(
  alias-tips
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
