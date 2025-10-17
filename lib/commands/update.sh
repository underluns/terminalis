#!/usr/bin/env sh

terminalis_update() {
  case "$1" in
    'terminalis' | '--terminalis' | '')
      (cd "$(__terminalis_root)" && __terminalis_git_pull)
      ;;
    'system' | '--system')
      if __terminalis_system_software_is_exists; then
        __terminalis_system_software_update
      fi
      if __terminalis_system_apt_is_exists; then
        __terminalis_system_apt_update && __terminalis_system_apt_clean
      fi
      if __terminalis_system_brew_is_exists; then
        __terminalis_system_brew_update && __terminalis_system_brew_clean
      fi
      ;;
    'all' | '--all' | '-a')
      terminalis_update terminalis
      terminalis_update system
      ;;
    '--help' | '-h')
      terminalis_help update
      ;;
    *)
      __terminalis_error_command_not_found "$1"
      ;;
  esac
}
