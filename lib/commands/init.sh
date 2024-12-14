#!/usr/bin/env sh

__terminalis_init() {
  local root=${TERMINALIS_ROOT}
  local command=${1}

  case $command in
    "")
      source $root/lib/scripts/git_line.sh
      ;;
    "--reload" | "-r")
      source $root/install.sh
      ;;  
    "--help" | "-h")
      cat $root/help/commands/init.txt
      ;;
    *)
      $root/lib/shared/error.sh unknown $command
      ;;
  esac
}

__terminalis_init "$@"
