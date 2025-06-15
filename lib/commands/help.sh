#!/usr/bin/env sh

terminalis_help() {
  case "$1" in
    "")
      cat "$(__terminalis_root)/help/terminalis.txt"
      cat "$(__terminalis_root)/help/commands/init.txt"
      cat "$(__terminalis_root)/help/commands/help.txt";;
    "init")
      cat "$(__terminalis_root)/help/commands/init.txt";;
    "help" | "--help" | "-h")
      cat "$(__terminalis_root)/help/commands/help.txt";;
    *)
      echo "terminalis_help: command not found: $1" 1>&2
      return 1;;
  esac
}
