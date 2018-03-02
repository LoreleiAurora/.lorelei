BULLETTRAIN_PROMPT_ORDER=(
    time
    dir
    go_always
    nvm
    perl
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

BULLETTRAIN_GO_BG=cyan
BULLETTRAIN_GO_FG=black
BULLETTRAIN_GO_PREFIX="🐿 "

BULLETTRAIN_PERL_BG=yellow
BULLETTRAIN_PERL_FG=black
BULLETTRAIN_PERL_PREFIX="🐪 "

BULLETTRAIN_RUBY_BG=red
BULLETTRAIN_RUBY_FG=black
BULLETTRAIN_RUBY_PREFIX="♦️ "

BULLETTRAIN_NVM_BG=green
BULLETTRAIN_NVM_FG=black
BULLETTRAIN_NVM_PREFIX="⬡ "

BULLETTRAIN_VIRTUALENV_BG=white
BULLETTRAIN_VIRTUALENV_FG=black
BULLETTRAIN_VIRTUALENV_PREFIX="🐍 "

# PHP
prompt_php() {
  setopt extended_glob
  prompt_segment $BULLETTRAIN_PHP_BG $BULLETTRAIN_PHP_FG $BULLETTRAIN_PHP_PREFIX" $(php -v | head -1 | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')"
}

prompt_go_always() {
  setopt extended_glob
  if command -v go > /dev/null 2>&1; then
    prompt_segment $BULLETTRAIN_GO_BG $BULLETTRAIN_GO_FG $BULLETTRAIN_GO_PREFIX" $(go version | grep --colour=never -oE '[[:digit:]].[[:digit:]]')"
  fi
}

. $ZSH_CUSTOM/bullet-train/bullet-train.zsh-theme
