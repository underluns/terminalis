#!/usr/bin/env sh

__terminalis_init() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../../)
  local -r command=${1}

  case $command in
    "")
      source $root/lib/scripts/git_line.sh
      ;;
    "--help" | "-h")
      $root/lib/commands/help.sh init
      ;;
    *)
      $root/lib/shared/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_init "$@"
