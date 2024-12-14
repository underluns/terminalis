#!/usr/bin/env sh

__terminalis_git_line() {
  local root=${TERMINALIS_ROOT}

  declare -g TERMINALIS_COLOR_CWD=${TERMINALIS_COLOR_CWD:-"$($root/lib/shared/color.sh bold blue)"}
  declare -g TERMINALIS_COLOR_GIT=${TERMINALIS_COLOR_GIT:-"$($root/lib/shared/color.sh bold yellow)"}
  declare -g TERMINALIS_COLOR_SUCCESS=${TERMINALIS_COLOR_SUCCESS:-"$($root/lib/shared/color.sh white)"}
  declare -g TERMINALIS_COLOR_FAILURE=${TERMINALIS_COLOR_FAILURE:-"$($root/lib/shared/color.sh red)"}

  declare -g TERMINALIS_SYMBOL_PROMPT=${TERMINALIS_SYMBOL_PROMPT:-"\$"}
  declare -g TERMINALIS_SYMBOL_GIT_PUSH=${TERMINALIS_SYMBOL_GIT_PUSH:-"↑"}
  declare -g TERMINALIS_SYMBOL_GIT_PULL=${TERMINALIS_SYMBOL_GIT_PULL:-"↓"}
  declare -g TERMINALIS_SYMBOL_GIT_MODIFIED=${TERMINALIS_SYMBOL_GIT_MODIFIED:-"*"}

  __terminalis_git_branch() {
    $(git rev-parse --is-inside-work-tree 2>/dev/null) || return

    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)

    echo $branch
  }

  __terminalis_git_info() {
    $(git rev-parse --is-inside-work-tree 2>/dev/null) || return

    local branch=$(__terminalis_git_branch)

    local ahead=$(git rev-list --count origin/${branch}..${branch})
    local behind=$(git rev-list --count ${branch}..origin/${branch})

    local marks
    if [[ -n "$(git status --porcelain)" ]]; then
      marks="${TERMINALIS_SYMBOL_GIT_MODIFIED}${marks}"
    fi

    if [[ $ahead -ne 0 ]]; then
      marks="${marks} ${TERMINALIS_SYMBOL_GIT_PUSH}${ahead}"
    fi

    if [[ $behind -ne 0 ]]; then
      marks="${marks} ${TERMINALIS_SYMBOL_GIT_PULL}${behind}"
    fi

    echo " $branch$marks"
  }

  __terminalis_git_prompt() {
    if [[ $? -eq 0 ]]; then
      local status_color=${TERMINALIS_COLOR_SUCCESS}
    else
      local status_color=${TERMINALIS_COLOR_FAILURE}
    fi

    local root=${TERMINALIS_ROOT}
    local cwd="$($root/lib/shared/style.sh "\w" "${TERMINALIS_COLOR_CWD}" -ps)"
    local git="$($root/lib/shared/style.sh "$(__terminalis_git_info)" "${TERMINALIS_COLOR_GIT}" -ps)"
    local prompt="$($root/lib/shared/style.sh " ${TERMINALIS_SYMBOL_PROMPT} " "${status_color}" -ps)"

    PS1="${cwd}${git}${prompt}"
  }

  PROMPT_COMMAND=__terminalis_git_prompt
}

__terminalis_git_line
