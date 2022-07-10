#!/bin/bash

# Random cowsay moods
# Required packages: cowsay, fortune, and lolcat

function rcs (){
  local options=("b" "d" "g" "p" "s" "t" "w" "y")
  local index=$(( $RANDOM % ${#options[@]} + 1))
  local randomModeCowsay="cowsay -${options[index]}"

  fortune -s | eval $randomModeCowsay | lolcat
}
