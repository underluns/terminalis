#!/usr/bin/env sh

__terminalis_shell_is_bash() {
  test -n "$BASH_VERSION"
}

__terminalis_shell_is_zsh() {
  test -n "$ZSH_VERSION"
}
