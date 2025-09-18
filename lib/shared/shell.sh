#!/usr/bin/env sh

__terminalis_shell_is_bash() {
  [ -n "${BASH_VERSION}" ]
}

__terminalis_shell_is_zsh() {
  [ -n "${ZSH_VERSION}" ]
}
