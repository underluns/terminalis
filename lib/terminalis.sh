#!/usr/bin/env sh

__terminalis_root() {
  echo "${TERMINALIS_ROOT:?}"
}

. "$(__terminalis_root)/lib/shared/common.sh"
. "$(__terminalis_root)/lib/commands/help.sh"
. "$(__terminalis_root)/lib/commands/init.sh"

terminalis() {
  case "$1" in
    "init")
      shift && terminalis_init "$@";;
    "help")
      shift && terminalis_help "$@";;
    "--help" | "-h" | "")
      terminalis_help;;
    *)
      echo "terminalis: command not found: $1" 1>&2 && return 1;;
  esac
}
