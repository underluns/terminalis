#!/usr/bin/env sh

__terminalis_reload() {
  local lib=$(realpath $(dirname ${BASH_SOURCE[0]})/../)
  local command=${1}

  case $command in
    "")
      source $lib/../install.sh
      ;;
    "--help" | "-h")
      $lib/commands/help.sh reload
      ;;
    *)
      $lib/scripts/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_reload $@
unset __terminalis_reload
