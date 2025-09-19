#!/usr/bin/env sh

__terminalis_root() {
  echo "${TERMINALIS_ROOT:?}"
}

. "$(__terminalis_root)/lib/shared/common.sh"
. "$(__terminalis_root)/lib/commands/help.sh"
. "$(__terminalis_root)/lib/commands/init.sh"
. "$(__terminalis_root)/lib/commands/update.sh"

terminalis() {
  case "$1" in
    'init')
      shift && terminalis_init "$@"
      ;;
    'update')
      shift && terminalis_update "$@"
      ;;
    'help')
      shift && terminalis_help "$@"
      ;;
    '--help' | '-h' | '')
      terminalis_help
      ;;
    *)
      __terminalis_error "command not found: $1"
      ;;
  esac
}
