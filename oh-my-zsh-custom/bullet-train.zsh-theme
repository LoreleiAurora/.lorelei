BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    context
    dir
    perl
    ruby
    virtualenv
    nvm
    go
    php
    git
    cmd_exec_time
  )

# Go
if [ ! -n "${BULLETTRAIN_PHP_BG+1}" ]; then
  BULLETTRAIN_PHP_BG=cyan
fi
if [ ! -n "${BULLETTRAIN_PHP_FG+1}" ]; then
  BULLETTRAIN_PHP_FG=white
fi
if [ ! -n "${BULLETTRAIN_PHP_PREFIX+1}" ]; then
  BULLETTRAIN_PHP_PREFIX="php"
fi

# PHP
prompt_php() {
  setopt extended_glob
  prompt_segment $BULLETTRAIN_PHP_BG $BULLETTRAIN_PHP_FG $BULLETTRAIN_PHP_PREFIX" $(php -v | head -1 | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')"
}

. $ZSH_CUSTOM/bullet-train/bullet-train.zsh-theme
