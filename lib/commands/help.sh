#!/usr/bin/env sh

__terminalis_help() {
  local lib=$(realpath $(dirname ${BASH_SOURCE[0]})/../)
  local command=${1}

  case $command in
    "")
      cat $lib/help/terminalis.txt
      cat $lib/help/init.txt
      cat $lib/help/reload.txt
      cat $lib/help/help.txt
      ;;
    "init")
      cat $lib/help/init.txt
      ;;
    "reload")
      cat $lib/help/reload.txt
      ;;  
    "--help" | "-h")
      cat $lib/help/help.txt
      ;;
    *)
      $lib/errors/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_help $@
unset __terminalis_help
