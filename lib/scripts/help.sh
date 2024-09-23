#!/usr/bin/env sh

__terminalis_help() {
  local current=${BASH_SOURCE[0]}
  local command=${1}

  case $command in
    "")
      echo "terminalis help all"
      ;;
    "init" | "reload")
      echo "terminalis help init|reload"
      ;;
    "--help" | "-h")
      echo "terminalis help help"
      ;;
    *)
      $(dirname $current)/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_help $@
unset __terminalis_help
