#!/usr/bin/env sh

__terminalis_style() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../../)  
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
      return 1
      ;;
  esac

  echo -e $result
}

__terminalis_style "$@"
