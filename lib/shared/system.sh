#!/usr/bin/env sh

__terminalis_system_software_is_exists() {
  __terminalis_shell_command_is_exists softwareupdate
}

__terminalis_system_apt_is_exists() {
  __terminalis_shell_command_is_exists apt
}

__terminalis_system_brew_is_exists() {
  __terminalis_shell_command_is_exists brew
}

__terminalis_system_snap_is_exists() {
  __terminalis_shell_command_is_exists snap
}

__terminalis_system_software_update() {
  softwareupdate --install --all --agree-to-license
}

__terminalis_system_apt_update() {
  sudo apt update --list-cleanup --yes &&
    sudo apt upgrade --yes &&
    sudo apt full-upgrade --yes
}

__terminalis_system_apt_clean() {
  sudo apt autoremove --purge --yes &&
    sudo apt autoclean --yes &&
    sudo apt clean --yes
}

__terminalis_system_brew_update() {
  brew update --force &&
    brew upgrade &&
    brew upgrade --cask --greedy
}

__terminalis_system_brew_clean() {
  brew cleanup --prune=all
}

__terminalis_system_snap_update() {
  sudo snap refresh
}
