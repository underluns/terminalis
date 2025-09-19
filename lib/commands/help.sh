#!/usr/bin/env sh

terminalis_help() {
  case "$1" in
    '')
      __terminalis_cat "help/terminalis.txt"
      ;;
    'init')
      __terminalis_cat "help/commands/init.txt"
      ;;
    'update')
      __terminalis_cat "help/commands/update.txt"
      ;;
    'help' | '--help' | '-h')
      __terminalis_cat "help/commands/help.txt"
      ;;
    'all' | '--all' | '-a')
      terminalis_help
      terminalis_help init
      terminalis_help update
      terminalis_help help
      ;;
    *)
      __terminalis_error_command_not_found "$1"
      ;;
  esac
}
