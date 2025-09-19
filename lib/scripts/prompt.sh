#!/usr/bin/env sh

if __terminalis_shell_is_zsh; then
  TERMINALIS_PROMPT_PWD_PREFIX='%{%F{blue}%}'
  TERMINALIS_PROMPT_PWD_SUFFIX=' %{%f%}'
  TERMINALIS_PROMPT_GIT_PREFIX='%{%F{yellow}%}'
  TERMINALIS_PROMPT_GIT_SUFFIX=' %{%f%}'
  TERMINALIS_PROMPT_STATUS_SUCCESS_PREFIX='%{%F{white}%}'
  TERMINALIS_PROMPT_STATUS_SUCCESS_SUFFIX=' %{%f%}'
  TERMINALIS_PROMPT_STATUS_FAILURE_PREFIX='%{%F{red}%}'
  TERMINALIS_PROMPT_STATUS_FAILURE_SUFFIX=' %{%f%}'
  TERMINALIS_PROMPT_STATUS_SUCCESS_SYMBOL='%#'
  TERMINALIS_PROMPT_STATUS_FAILURE_SYMBOL='%#'
elif __terminalis_shell_is_bash; then
  TERMINALIS_PROMPT_PWD_PREFIX='\[\033[0;34m\]'
  TERMINALIS_PROMPT_PWD_SUFFIX=' \[\033[0m\]'
  TERMINALIS_PROMPT_GIT_PREFIX='\[\033[0;33m\]'
  TERMINALIS_PROMPT_GIT_SUFFIX=' \[\033[0m\]'
  TERMINALIS_PROMPT_STATUS_SUCCESS_PREFIX='\[\033[0;37m\]'
  TERMINALIS_PROMPT_STATUS_SUCCESS_SUFFIX=' \[\033[0m\]'
  TERMINALIS_PROMPT_STATUS_FAILURE_PREFIX='\[\033[0;31m\]'
  TERMINALIS_PROMPT_STATUS_FAILURE_SUFFIX=' \[\033[0m\]'
  TERMINALIS_PROMPT_STATUS_SUCCESS_SYMBOL='\$'
  TERMINALIS_PROMPT_STATUS_FAILURE_SYMBOL='\$'
else
  TERMINALIS_PROMPT_PWD_PREFIX=''
  TERMINALIS_PROMPT_PWD_SUFFIX=' '
  TERMINALIS_PROMPT_GIT_PREFIX=''
  TERMINALIS_PROMPT_GIT_SUFFIX=' '
  TERMINALIS_PROMPT_STATUS_SUCCESS_PREFIX=''
  TERMINALIS_PROMPT_STATUS_SUCCESS_SUFFIX=' '
  TERMINALIS_PROMPT_STATUS_FAILURE_PREFIX=''
  TERMINALIS_PROMPT_STATUS_FAILURE_SUFFIX=' '
  TERMINALIS_PROMPT_STATUS_SUCCESS_SYMBOL='$'
  TERMINALIS_PROMPT_STATUS_FAILURE_SYMBOL='!'
fi
TERMINALIS_PROMPT_GIT_CHANGED_PREFIX=''
TERMINALIS_PROMPT_GIT_CHANGED_SUFFIX=''
TERMINALIS_PROMPT_GIT_AHEAD_PREFIX=' '
TERMINALIS_PROMPT_GIT_AHEAD_SUFFIX=''
TERMINALIS_PROMPT_GIT_BEHIND_PREFIX=' '
TERMINALIS_PROMPT_GIT_BEHIND_SUFFIX=''
TERMINALIS_PROMPT_GIT_CHANGED_SYMBOL='*'
TERMINALIS_PROMPT_GIT_AHEAD_SYMBOL='↑'
TERMINALIS_PROMPT_GIT_BEHIND_SYMBOL='↓'

__terminalis_prompt() {
  set -- "${1:-"$?"}"

  TERMINALIS_PROMPT="$(__terminalis_prompt_pwd)$(__terminalis_prompt_git)$(__terminalis_prompt_status "$1")" && echo "${TERMINALIS_PROMPT}"
}

__terminalis_prompt_pwd() {
  echo "${TERMINALIS_PROMPT_PWD_PREFIX}$(__terminalis_pwd)${TERMINALIS_PROMPT_PWD_SUFFIX}"
}

__terminalis_prompt_git(){
  if __terminalis_git_is_repo; then
    _terminalis_prompt_git_ref="$(__terminalis_git_ref)"
    _terminalis_prompt_git_marks="$(__terminalis_prompt_git_changed)$(__terminalis_prompt_git_ahead "${_terminalis_prompt_git_ref}")$(__terminalis_prompt_git_behind "${_terminalis_prompt_git_ref}")"

    echo "${TERMINALIS_PROMPT_GIT_PREFIX}${_terminalis_prompt_git_ref}${_terminalis_prompt_git_marks}${TERMINALIS_PROMPT_GIT_SUFFIX}"
  fi
}

__terminalis_prompt_git_changed() {
  if __terminalis_git_is_changed; then
    echo "${TERMINALIS_PROMPT_GIT_CHANGED_PREFIX}${TERMINALIS_PROMPT_GIT_CHANGED_SYMBOL}${TERMINALIS_PROMPT_GIT_CHANGED_SUFFIX}"
  fi
}

__terminalis_prompt_git_ahead() {
  _terminalis_prompt_git_ref="${1:-"$(__terminalis_git_ref)"}"
  _terminalis_prompt_git_ahead="$(__terminalis_git_count_diff_ahead "${_terminalis_prompt_git_ref}")"

  if [ "${_terminalis_prompt_git_ahead}" -ne 0 ]; then
    echo "${TERMINALIS_PROMPT_GIT_AHEAD_PREFIX}${TERMINALIS_PROMPT_GIT_AHEAD_SYMBOL}${_terminalis_prompt_git_ahead}${TERMINALIS_PROMPT_GIT_AHEAD_SUFFIX}"
  fi
}

__terminalis_prompt_git_behind() {
  _terminalis_prompt_git_ref="${1:-"$(__terminalis_git_ref)"}"
  _terminalis_prompt_git_behind="$(__terminalis_git_count_diff_behind "${_terminalis_prompt_git_ref}")"

  if [ "${_terminalis_prompt_git_behind}" -ne 0 ]; then
    echo "${TERMINALIS_PROMPT_GIT_BEHIND_PREFIX}${TERMINALIS_PROMPT_GIT_BEHIND_SYMBOL}${_terminalis_prompt_git_behind}${TERMINALIS_PROMPT_GIT_BEHIND_SUFFIX}"
  fi
}

__terminalis_prompt_status() {
  if [ "${1:-"$?"}" -eq 0 ]; then
    echo "${TERMINALIS_PROMPT_STATUS_SUCCESS_PREFIX}${TERMINALIS_PROMPT_STATUS_SUCCESS_SYMBOL}${TERMINALIS_PROMPT_STATUS_SUCCESS_SUFFIX}"
  else
    echo "${TERMINALIS_PROMPT_STATUS_FAILURE_PREFIX}${TERMINALIS_PROMPT_STATUS_FAILURE_SYMBOL}${TERMINALIS_PROMPT_STATUS_FAILURE_SUFFIX}"
  fi
}

precmd() {
  PS1="$(__terminalis_prompt "$?")"

  __terminalis_pwd > /dev/null
}
PROMPT_COMMAND=precmd
