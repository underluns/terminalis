#!/usr/bin/env sh

__terminalis_init() {
  local current=${BASH_SOURCE[0]}
  local command=${1}

  case $command in
    "")
      echo "terminalis init"
      ;;
    "--help" | "-h")
      $(dirname $current)/scripts/help.sh init
      ;;
    *)
      $(dirname $current)/scripts/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_init $@
unset __terminalis_init
