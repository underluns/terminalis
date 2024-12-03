#!/usr/bin/env sh

__terminalis_help() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../../)
  local -r command=${1}

  case $command in
    "")
      cat $root/lib/help/terminalis.txt
      cat $root/lib/help/init.txt
      cat $root/lib/help/reload.txt
      cat $root/lib/help/help.txt
      ;;
    "init")
      cat $root/lib/help/init.txt
      ;;
    "reload")
      cat $root/lib/help/reload.txt
      ;;  
    "--help" | "-h")
      cat $root/lib/help/help.txt
      ;;
    *)
      $root/lib/errors/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_help $@
unset __terminalis_help
