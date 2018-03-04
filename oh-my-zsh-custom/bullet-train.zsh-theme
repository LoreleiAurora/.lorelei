BULLETTRAIN_PROMPT_ORDER=(
    time
    dir
    nvm
    php
    virtualenv
    ruby
    git
    cmd_exec_time
    status
  )

BULLETTRAIN_DIR_BG=black
BULLETTRAIN_DIR_FG=default
BULLETTRAIN_DIR_CONTEXT_SHOW=false
BULLETTRAIN_DIR_EXTENDED=1

BULLETTRAIN_PHP_BG=blue
BULLETTRAIN_PHP_FG=black
BULLETTRAIN_PHP_PREFIX="🐘 "

BULLETTRAIN_RUBY_BG=red
BULLETTRAIN_RUBY_FG=black
BULLETTRAIN_RUBY_PREFIX="♦️ "

BULLETTRAIN_NVM_BG=green
BULLETTRAIN_NVM_FG=black
BULLETTRAIN_NVM_PREFIX="⬡ "

BULLETTRAIN_VIRTUALENV_BG=yellow
BULLETTRAIN_VIRTUALENV_FG=black
BULLETTRAIN_VIRTUALENV_PREFIX="🐍 "

# PHP
prompt_php() {
  setopt extended_glob
  prompt_segment $BULLETTRAIN_PHP_BG $BULLETTRAIN_PHP_FG $BULLETTRAIN_PHP_PREFIX" $(php -v | head -1 | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')"
}

. $ZSH_CUSTOM/bullet-train/bullet-train.zsh-theme
