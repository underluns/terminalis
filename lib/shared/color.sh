#!/usr/bin/env sh

__terminalis_color() {
  local color_reset="0"
  # styles
  local color_bold="1"
  local color_faint="2"
  local color_italic="3"
  local color_underline="4"
  local color_blink="5"
  local color_reverse="7"
  local color_hide="8"
  local color_cross="9"
  # foreground
  local color_black="30"
  local color_red="31"
  local color_green="32"
  local color_yellow="33"
  local color_blue="34"
  local color_purple="35"
  local color_cyan="36"
  local color_white="37"
  # background
  local color_on_black="40"
  local color_on_red="41"
  local color_on_green="42"
  local color_on_yellow="43"
  local color_on_blue="44"
  local color_on_purple="45"
  local color_on_cyan="46"
  local color_on_white="47"

  local result=${color_reset}

  for option in $@; do
    local color=color_${option}
    
    result+=";${!color}"
  done

  echo $result
}

__terminalis_color "$@"
