#!/usr/bin/env sh

terminalis_update() {
  case "$1" in
    'terminalis' | '--terminalis' | '')
      (cd "$(__terminalis_root)" && __terminalis_git_pull)
      ;;
    'all' | '--all' | '-a')
      terminalis_update terminalis
      ;;
    '--help' | '-h')
      terminalis_help update
      ;;
    *)
      __terminalis_error_command_not_found "$1"
      ;;
  esac
}
