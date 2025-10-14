#!/usr/bin/env sh

__terminalis_error() {
  echo "terminalis: ${1:-"error"}" 1>&2 && return "${2:-1}"
}

__terminalis_error_status() {
  set -- "${1:-"$?"}"

  echo "$1" 1>&2 && return "$1"
}

__terminalis_error_command_not_found() {
  __terminalis_error "command not found: ${1:?}" 127
}
