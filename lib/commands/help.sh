#!/usr/bin/env sh

terminalis_help() {
  case "$1" in
    '')
      cat "$(__terminalis_root)/help/terminalis.txt"
      terminalis_help init
      terminalis_help update
      terminalis_help help
      ;;
    'init')
      cat "$(__terminalis_root)/help/commands/init.txt"
      ;;
    'update')
      cat "$(__terminalis_root)/help/commands/update.txt"
      ;;
    'help' | '--help' | '-h')
      cat "$(__terminalis_root)/help/commands/help.txt"
      ;;
    *)
      __terminalis_error_command_not_found "$1"
      ;;
  esac
}
