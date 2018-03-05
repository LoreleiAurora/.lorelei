# Setup the prompt with pretty colors
setopt prompt_subst

PROMPT_GIT_DIRTY=" %F{red}✘%F{black}"
PROMPT_GIT_CLEAN=" %F{green}✔%F{black}"
PROMPT_GIT_ADDED=" %F{green}✚%F{black}"
PROMPT_GIT_MODIFIED=" %F{blue}✹%F{black}"
PROMPT_GIT_DELETED=" %F{red}✖%F{black}"
PROMPT_GIT_UNTRACKED=" %F{yellow}✭%F{black}"
PROMPT_GIT_RENAMED=" ➜"
PROMPT_GIT_UNMERGED=" ═"
PROMPT_GIT_AHEAD=" ⬆"
PROMPT_GIT_BEHIND=" ⬇"
PROMPT_GIT_DIVERGED=" ⬍"

CURRENT_BG='NONE'
PROMPT_SEGMENT_SEPARATOR=''

# Begin a segment
# Takes three arguments, background, foreground and text. All of them can be omitted,
# rendering default background/foreground and no text.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$PROMPT_SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$PROMPT_SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

# ------------------------------------------------------------------------------
# PROMPT COMPONENTS
# Each component will draw itself, and hide itself if no information needs
# to be shown
# ------------------------------------------------------------------------------

# Based on http://stackoverflow.com/a/32164707/3859566
function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd' $D
  [[ $H > 0 ]] && printf '%dh' $H
  [[ $M > 0 ]] && printf '%dm' $M
  printf '%ds' $S
}

# Prompt previous command execution time
preexec() {
  cmd_timestamp=`date +%s`
}

precmd() {
  local stop=`date +%s`
  local start=${cmd_timestamp:-$stop}
  let PROMPT_last_exec_duration=$stop-$start
  cmd_timestamp=''
}

# Git
# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo "\ue0a0 ${ref#refs/heads/}$(parse_git_dirty)"
}

# Get the status of the working tree
function git_prompt_status() {
  local INDEX STATUS
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    STATUS="$PROMPT_GIT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$PROMPT_GIT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$PROMPT_GIT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$PROMPT_GIT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$PROMPT_GIT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$PROMPT_GIT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$PROMPT_GIT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$PROMPT_GIT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$PROMPT_GIT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$PROMPT_GIT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$PROMPT_GIT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$PROMPT_GIT_DELETED$STATUS"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$PROMPT_GIT_STASHED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$PROMPT_GIT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    STATUS="$PROMPT_GIT_AHEAD$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null); then
    STATUS="$PROMPT_GIT_BEHIND$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*diverged' &> /dev/null); then
    STATUS="$PROMPT_GIT_DIVERGED$STATUS"
  fi
  echo $STATUS
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ $POST_1_7_2_GIT -gt 0 ]]; then
    FLAGS+='--ignore-submodules=dirty'
  fi
  if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
    FLAGS+='--untracked-files=no'
  fi
  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "$PROMPT_GIT_DIRTY"
  else
    echo "$PROMPT_GIT_CLEAN"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="✘ $RETVAL"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]]; then
    prompt_segment red black "$symbols"
  elif [[ -n "$symbols" ]]; then
    prompt_segment green black "$symbols"
  fi

}

# ------------------------------------------------------------------------------
# MAIN
# Entry point
# ------------------------------------------------------------------------------

build_prompt() {
  RETVAL=$?
  prompt_segment white black %D{%r}
  prompt_segment black default "${dir}%4(c:...:)%3c"
  prompt_segment green black "⬡ $(nvm current 2>/dev/null)"
  prompt_segment blue black "🐘  $(php -v | head -1 | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')"
  prompt_segment yellow black "🐍  $(pyenv version | sed -e 's/ (set.*$//' | tr '\n' ' ' | sed 's/.$//')"
  prompt_segment red black "♦️  $(rbenv version | sed -e 's/ (set.*$//')"
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then prompt_segment white black "$(git_prompt_info)$(git_prompt_status)"; fi
  [ $PROMPT_last_exec_duration -gt 5 ] && prompt_segment yellow black "$(displaytime $PROMPT_last_exec_duration)"
  prompt_status
  prompt_end
}

NEWLINE='
'
PROMPT=''
PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{%f%b%k%}$(build_prompt)'
PROMPT="$PROMPT$NEWLINE"
PROMPT="$PROMPT"'%{${fg_bold[default]}%}'
PROMPT="$PROMPT"'%(!.%F{red}# .%F{green}\$%f)%{$reset_color%} '
