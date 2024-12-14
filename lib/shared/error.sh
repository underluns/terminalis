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
      ;;
  esac

  return 1
}

__terminalis_error "$@"
