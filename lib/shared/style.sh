#!/usr/bin/env sh

__terminalis_style() {
  local -r root=${TERMINALIS_ROOT}
  local -r text=${1}
  local -r styles=${2}
  local -r option=${3}

  case $option in
    "--bash" | "")
      local result="\033[${styles}m${text}\033[0m"
      ;;
    "--prompts" | "-ps")
      local result="\[\033[${styles}m\]${text}\[\033[0m\]"
      ;;
    *)
      $root/lib/shared/error.sh unknown $option
      ;;
  esac

  echo -e $result
}

__terminalis_style "$@"
