#!/bin/bash

if [ -z "$1" ];
then 
  echo "Usage: ./install.sh <targetFile>"
  echo "Example:"
  echo "         ./install.sh ~/.bashrc"
  echo "         ./install.sh ~/.zshrc"
else
  if ! grep -q BU_PATH "$1"; then
    echo "Adding configuration to $1"
    echo "export BU_PATH=$(pwd)" >> $1
    echo "source \$BU_PATH/config.sh" >> $1
  fi
  echo "Done."
fi
