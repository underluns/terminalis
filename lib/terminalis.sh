#!/usr/bin/env sh

terminalis() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../)
  local -r command=${1:---help}

  case $command in
    "init")
      shift
      source $root/lib/commands/init.sh $@
      ;;
    "reload")
      shift
      source $root/lib/commands/reload.sh $@
      ;;
    "help")
      shift
      $root/lib/commands/help.sh $@
      ;;
    "--help" | "-h")
      $root/lib/commands/help.sh
      ;;
    *)
      $root/lib/shared/error.sh unknown $command
      return 1
      ;;
  esac
}

terminalis $@
