#!/usr/bin/env sh

__terminalis_source "lib/shared/errors.sh"
__terminalis_source "lib/shared/git.sh"
__terminalis_source "lib/shared/shell.sh"

__terminalis_pwd() {
  TERMINALIS_PWD="$(echo "${PWD}" | sed "s|^${HOME}|~|")" && echo "${TERMINALIS_PWD}"
}

__terminalis_cd() {
  cd "$(__terminalis_root)"
}

__terminalis_cat() {
  cat "$(__terminalis_root)/$1"
}
