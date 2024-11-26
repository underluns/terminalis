#!/usr/bin/env sh

__terminalis_init() {
  local lib=$(realpath $(dirname ${BASH_SOURCE[0]})/../)
  local command=${1}

  case $command in
    "")
      $lib/scripts/git_line.sh
      ;;
    "--help" | "-h")
      $lib/commands/help.sh init
      ;;
    *)
      $lib/errors/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_init $@
unset __terminalis_init
