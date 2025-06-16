#!/usr/bin/env sh

if __terminalis_shell_is_zsh; then
  TERMINALIS_PROMPT_PWD_PREFIX="%{%F{blue}%}"
  TERMINALIS_PROMPT_PWD_SUFFIX="%{%f%} "
  TERMINALIS_PROMPT_GIT_PREFIX="%{%F{yellow}%}"
  TERMINALIS_PROMPT_GIT_SUFFIX="%{%f%} "
  TERMINALIS_PROMPT_STATUS_SUCCESS="%{%F{white}%}%#%{%f%} "
  TERMINALIS_PROMPT_STATUS_FAILURE="%{%F{red}%}%#%{%f%} "
elif __terminalis_shell_is_bash; then
  TERMINALIS_PROMPT_PWD_PREFIX="\[\033[0;34m\]"
  TERMINALIS_PROMPT_PWD_SUFFIX="\[\033[0m\] "
  TERMINALIS_PROMPT_GIT_PREFIX="\[\033[0;33m\]"
  TERMINALIS_PROMPT_GIT_SUFFIX="\[\033[0m\] "
  TERMINALIS_PROMPT_STATUS_SUCCESS="\[\033[0;37m\]\$\[\033[0m\] "
  TERMINALIS_PROMPT_STATUS_FAILURE="\[\033[0;31m\]\$\[\033[0m\] "
else
  TERMINALIS_PROMPT_PWD_PREFIX=""
  TERMINALIS_PROMPT_PWD_SUFFIX=" "
  TERMINALIS_PROMPT_GIT_PREFIX=""
  TERMINALIS_PROMPT_GIT_SUFFIX=" "
  TERMINALIS_PROMPT_STATUS_SUCCESS="\$ "
  TERMINALIS_PROMPT_STATUS_FAILURE="\$! "
fi
TERMINALIS_PROMPT_GIT_MARK_CHANGES="*"
TERMINALIS_PROMPT_GIT_MARK_AHEAD=" ↑"
TERMINALIS_PROMPT_GIT_MARK_BEHIND=" ↓"

__terminalis_prompt_pwd() {
  echo "${TERMINALIS_PROMPT_PWD_PREFIX}$(__terminalis_pwd)${TERMINALIS_PROMPT_PWD_SUFFIX}"
}

__terminalis_prompt_git(){
  if ! __terminalis_git_is_repo; then
   return
  fi

  _terminalis_prompt_git_ref="$(__terminalis_git_ref)"
  _terminalis_prompt_git_count_ahead="$(__terminalis_git_count_ahead "${_terminalis_prompt_git_ref}")"
  _terminalis_prompt_git_count_behind="$(__terminalis_git_count_behind "${_terminalis_prompt_git_ref}")"

  if __terminalis_git_has_changes; then
    _terminalis_prompt_git_marks="${TERMINALIS_PROMPT_GIT_MARK_CHANGES}"
  fi
  if [ "${_terminalis_prompt_git_count_ahead}" -ne 0 ]; then
    _terminalis_prompt_git_marks="${_terminalis_prompt_git_marks}${TERMINALIS_PROMPT_GIT_MARK_AHEAD}${_terminalis_prompt_git_count_ahead}"
  fi
  if [ "${_terminalis_prompt_git_count_behind}" -ne 0 ]; then
    _terminalis_prompt_git_marks="${_terminalis_prompt_git_marks}${TERMINALIS_PROMPT_GIT_MARK_BEHIND}${_terminalis_prompt_git_count_behind}"
  fi

  echo "${TERMINALIS_PROMPT_GIT_PREFIX}${_terminalis_prompt_git_ref}${_terminalis_prompt_git_marks}${TERMINALIS_PROMPT_GIT_SUFFIX}"
}

__terminalis_prompt_status() {
  if [ "${1:-"$?"}" -eq 0 ]; then
    echo "${TERMINALIS_PROMPT_STATUS_SUCCESS}"
  else
    echo "${TERMINALIS_PROMPT_STATUS_FAILURE}"
  fi
}

__terminalis_prompt() {
  set -- "${1:-"$?"}"

  TERMINALIS_PROMPT="$(__terminalis_prompt_pwd)$(__terminalis_prompt_git)$(__terminalis_prompt_status "$1")" && echo "${TERMINALIS_PROMPT}"
  PS1="${TERMINALIS_PROMPT}"
}

precmd() {
  __terminalis_prompt "$?" > /dev/null
  __terminalis_pwd > /dev/null
}
PROMPT_COMMAND=precmd
