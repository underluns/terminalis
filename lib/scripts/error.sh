#!/usr/bin/env sh

__terminalis_error() {
  local error=${1}

  case $error in
    "unknown")
      local command=${2}
      echo "Unknown command or option: $command"
      ;;
    *)
      echo "Unknown error: $error"
      return 1
      ;;
  esac
}

__terminalis_error $@
unset __terminalis_error
