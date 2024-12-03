#!/usr/bin/env sh

__terminalis_git_line() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../../)

  declare -g -A TERMINALIS_COLORS=(
    [cwd]=${TERMINALIS_COLOR_CWD:-"$($root/lib/shared/color.sh bold blue)"}
    [git]=${TERMINALIS_COLOR_GIT:-"$($root/lib/shared/color.sh bold yellow)"}
    [success]=${TERMINALIS_COLOR_SUCCESS:-"$($root/lib/shared/color.sh white)"}
    [failure]=${TERMINALIS_COLOR_FAILURE:-"$($root/lib/shared/color.sh red)"}
  )

  declare -g -A TERMINALIS_SYMBOLS=(
    [prompt]=${TERMINALIS_SYMBOL_PROMPT:-"\$"}
    [git_push]=${TERMINALIS_SYMBOL_GIT_PUSH:-"↑"}
    [git_pull]=${TERMINALIS_SYMBOL_GIT_PULL:-"↓"}
    [git_modified]=${TERMINALIS_SYMBOL_GIT_MODIFIED:-"*"}
  )

  __terminalis_git_branch() {
    $(git rev-parse --is-inside-work-tree 2>/dev/null) || return

    local -r branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)

    echo $branch
  }

  __terminalis_git_info() {
    $(git rev-parse --is-inside-work-tree 2>/dev/null) || return

    local branch=$(__terminalis_git_branch)

    local ahead=$(git rev-list --count origin/${branch}..${branch})
    local behind=$(git rev-list --count ${branch}..origin/${branch})

    local marks
    if [[ -n "$(git status --porcelain)" ]]; then
      marks="${TERMINALIS_SYMBOLS[git_modified]}${marks}"
    fi

    if [[ $ahead -ne 0 ]]; then
      marks="${marks} ${TERMINALIS_SYMBOLS[git_push]}${ahead}"
    fi

    if [[ $behind -ne 0 ]]; then
      marks="${marks} ${TERMINALIS_SYMBOLS[git_pull]}${behind}"
    fi

    echo " $branch$marks"
  }

  __terminalis_git_prompt() {
    if [[ $? -eq 0 ]]; then
      local status="success"
    else
      local status="failure"
    fi

    local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../../)
    local -r cwd="$($root/lib/shared/style.sh "\w" "${TERMINALIS_COLORS[cwd]}" -ps)"
    local -r git="$($root/lib/shared/style.sh "$(__terminalis_git_info)" "${TERMINALIS_COLORS[git]}" -ps)"
    local -r prompt="$($root/lib/shared/style.sh " ${TERMINALIS_SYMBOLS[prompt]} " "${TERMINALIS_COLORS[$status]}" -ps)"

    PS1="${cwd}${git}${prompt}"
  }

  PROMPT_COMMAND=__terminalis_git_prompt
}

__terminalis_git_line
