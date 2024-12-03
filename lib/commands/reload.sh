#!/usr/bin/env sh

__terminalis_reload() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../../)
  local -r command=${1}

  case $command in
    "")
      source $root/install.sh
      ;;
    "--help" | "-h")
      $root/lib/commands/help.sh reload
      ;;
    *)
      $root/lib/errors/error.sh unknown $command
      return 1
      ;;
  esac
}

__terminalis_reload $@
unset __terminalis_reload
