#!/usr/bin/env sh

__terminalis_help() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../../)
  local -r command=${1}

  case $command in
    "")
      cat $root/help/terminalis.txt
      cat $root/help/commands/init.txt
      cat $root/help/commands/reload.txt
      cat $root/help/commands/help.txt
      ;;
    "init")
      cat $root/help/commands/init.txt
      ;;
    "reload")
      cat $root/help/commands/reload.txt
      ;;
    "--help" | "-h")
      cat $root/help/commands/help.txt
      ;;
    *)
      $root/lib/shared/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_help $@
unset __terminalis_help
