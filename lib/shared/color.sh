#!/usr/bin/env sh

__terminalis_color() {
  local -A -r colors=(
    [reset]="0"

    # styles
    [bold]="1"
    [faint]="2"
    [italic]="3"
    [underline]="4"
    [blink]="5"
    [reverse]="7"
    [hide]="8"
    [cross]="9"

    # foreground
    [black]="30"
    [red]="31"
    [green]="32"
    [yellow]="33"
    [blue]="34"
    [purple]="35"
    [cyan]="36"
    [white]="37"

    # background
    [on_black]="40"
    [on_red]="41"
    [on_green]="42"
    [on_yellow]="43"
    [on_blue]="44"
    [on_purple]="45"
    [on_cyan]="46"
    [on_white]="47"
  )

  local result=${colors[reset]}

  for option in $@; do
    result="${result};${colors[$option]}"
  done

  echo $result
}

__terminalis_color $@
unset __terminalis_color
