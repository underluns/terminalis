#!/usr/bin/env sh

__terminalis_init() {
  local lib=$(realpath $(dirname ${BASH_SOURCE[0]})/../)
  local command=${1}

  case $command in
    "")
      echo "terminalis init"
      ;;
    "--help" | "-h")
      $lib/commands/help.sh init
      ;;
    *)
      $lib/scripts/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_init $@
unset __terminalis_init
