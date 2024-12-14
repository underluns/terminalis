#!/usr/bin/env sh

__terminalis_style() {
  local root=${TERMINALIS_ROOT}
  local text=${1}
  local styles=${2}
  local option=${3}

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
