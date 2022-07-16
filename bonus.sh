#!/bin/bash

# Random cowsay moods
# Required packages: cowsay, fortune, and lolcat

function rcs (){
  declare -a options=(b d g p s t w y)
  mode=${options[ $RANDOM % ${#options[@]} ]}
  randomModeCowsay="cowsay -$mode"

  fortune -s | eval "$randomModeCowsay" | lolcat
}
