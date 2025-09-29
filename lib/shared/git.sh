#!/usr/bin/env sh

__terminalis_git_is_repo() {
  [ -n "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]
}

__terminalis_git_is_changed() {
  [ -n "$(git status --porcelain 2>/dev/null)" ]
}

__terminalis_git_pull() {
  git pull --all --prune
}

__terminalis_git_ref() {
  __terminalis_git_ref_branch || __terminalis_git_ref_tag || __terminalis_git_ref_commit
}

__terminalis_git_ref_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

__terminalis_git_ref_tag() {
  git describe --tags 2>/dev/null
}

__terminalis_git_ref_commit() {
  git rev-parse --short HEAD 2>/dev/null
}

__terminalis_git_count_diff() {
  git rev-list --count "$1".."$2" 2>/dev/null
}

__terminalis_git_count_diff_ahead() {
  set -- "${1:-"$(__terminalis_git_ref)"}"

  __terminalis_git_count_diff "origin/$1" "$1"
}

__terminalis_git_count_diff_behind() {
  set -- "${1:-"$(__terminalis_git_ref)"}"

  __terminalis_git_count_diff "$1" "origin/$1"
}
