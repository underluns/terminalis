#!/usr/bin/env sh

terminalis() {
  local lib=$(dirname ${BASH_SOURCE[0]})
  local command=${1:---help}

  case $command in
    "init")
      shift
      source $lib/commands/init.sh $@
      ;;
    "reload")
      shift
      source $lib/commands/reload.sh $@
      ;;
    "help")
      shift
      $lib/commands/help.sh $@
      ;;  
    "--help" | "-h")
      $lib/commands/help.sh
      ;;
    *)
      $lib/scripts/error.sh unknown $command
      return 1
      ;;
  esac
}

terminalis $@
