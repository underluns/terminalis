#!/usr/bin/env sh

__terminalis_system_software_is_exists() {
  __terminalis_shell_command_is_exists softwareupdate
}

__terminalis_system_brew_is_exists() {
  __terminalis_shell_command_is_exists brew
}

__terminalis_software_update() {
  softwareupdate --install --all --agree-to-license
}

__terminalis_brew_update() {
  brew update --force
}

__terminalis_brew_upgrade() {
  brew upgrade --greedy
}

__terminalis_brew_cleanup() {
  brew cleanup --prune=all
}
