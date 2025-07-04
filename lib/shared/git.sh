#!/usr/bin/env sh

__terminalis_git_is_repo() {
  test -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)"
}

__terminalis_git_has_changes() {
  test -n "$(git status --porcelain 2> /dev/null)"
}

__terminalis_git_branch() {
  git symbolic-ref --short HEAD 2> /dev/null
}

__terminalis_git_tag() {
  git describe --tags 2> /dev/null
}

__terminalis_git_revision() {
  git rev-parse --short HEAD 2> /dev/null
}

__terminalis_git_ref() {
  __terminalis_git_branch || __terminalis_git_tag || __terminalis_git_revision
}

__terminalis_git_count_diff() {
  git rev-list --count "$1".."$2" 2> /dev/null
}

__terminalis_git_count_ahead() {
  __terminalis_git_count_diff "origin/$1" "$1"
}

__terminalis_git_count_behind() {
  __terminalis_git_count_diff "$1" "origin/$1"
}
