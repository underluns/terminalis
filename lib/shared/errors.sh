#!/usr/bin/env sh

__terminalis_error() {
  echo "terminalis: $1" 1>&2 && return 1
}

__terminalis_error_command_not_found() {
  __terminalis_error "command not found: $1"
}
