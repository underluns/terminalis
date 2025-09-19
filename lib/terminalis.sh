#!/usr/bin/env sh

__terminalis_root() {
  echo "${TERMINALIS_ROOT:?}"
}

__terminalis_source() {
  . "$(__terminalis_root)/$1"
}

__terminalis_source "lib/shared/common.sh"
__terminalis_source "lib/commands/help.sh"
__terminalis_source "lib/commands/init.sh"
__terminalis_source "lib/commands/update.sh"

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
      __terminalis_error_command_not_found "$1"
      ;;
  esac
}
