#!/bin/bash

if [ -z "$1" ];
then 
  echo "Usage: ./install.sh <targetFile>"
  echo "Example:"
  echo "         ./install.sh ~/.bashrc"
  echo "         ./install.sh ~/.zshrc"
else
  echo "Adding configuration to $1"
  addTo config.sh "$1" "Bash utilities configuration"
fi
