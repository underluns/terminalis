#!/usr/bin/env sh

terminalis() {
  local -r root=$(realpath $(dirname ${BASH_SOURCE[0]})/../)
  local -r command=${1:---help}

  case $command in
    "init")
      shift
      source $root/lib/commands/init.sh $@
      ;;
    "--help" | "-h")
      cat $root/help/terminalis.txt
      $root/lib/commands/init.sh --help
      ;;
    *)
      $root/lib/shared/error.sh unknown $command
      ;;
  esac
}

terminalis "$@"
