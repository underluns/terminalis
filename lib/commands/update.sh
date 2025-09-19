#!/usr/bin/env sh

terminalis_update() {
  case "$1" in
    '')
      ;;
    '--help' | '-h')
      terminalis_help update
      ;;
    *)
      __terminalis_error "command not found: $1"
      ;;
  esac
}
