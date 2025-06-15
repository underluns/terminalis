#!/usr/bin/env sh

terminalis_init() {
  case "$1" in
    "")
      . "$(__terminalis_root)/lib/scripts/prompt.sh";;
    "--help" | "-h")
      terminalis_help init;;
    *)
      echo "terminalis_init: command not found: $1" 1>&2
      return 1;;
  esac
}
