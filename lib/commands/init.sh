#!/usr/bin/env sh

terminalis_init() {
  case "$1" in
    '')
      . "$(__terminalis_root)/lib/scripts/prompt.sh"
      ;;
    '--help' | '-h')
      terminalis_help init
      ;;
    *)
      __terminalis_error_command_not_found "$1"
      ;;
  esac
}
