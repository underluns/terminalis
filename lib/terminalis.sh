#!/usr/bin/env sh

terminalis() {
  local current=${BASH_SOURCE[0]}
  local command=${1:-help}

  case $command in
    "init" | "load")
      source $(dirname $current)/init.sh
      ;;
    "reload" | "reinit")
      source $current init
      ;;
    "help" | "--help" | "-h")
      $(dirname $current)/scripts/help.sh
      ;;
    *)
      $(dirname $current)/scripts/error.sh unknown $command
      return 1
      ;;
  esac
}

terminalis $@
