#!/usr/bin/env sh

. "$(__terminalis_root)/lib/shared/git.sh"
. "$(__terminalis_root)/lib/shared/shell.sh"

__terminalis_pwd() {
  TERMINALIS_PWD="$(echo "${PWD}" | sed "s|^${HOME}|~|")" && echo "${TERMINALIS_PWD}"
}
