#!/bin/bash

BU_CONFIG=(
    alias
    functions
    # bonus
    zsh
    volta
 )

for util in "${BU_CONFIG[@]}"; do
    local file="$BU_PATH/src/$util.sh"
    [ -s $file ] && source $file
done
