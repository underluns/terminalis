#!/usr/bin/env sh

__terminalis_error() {
  echo "terminalis: $1" 1>&2 && return 1
}
