#!/bin/bash

export BU_PATH=$(pwd)
export BU_CONFIG=(
    alias
    functions
    # bonus
    zsh
 )

for util in "${BU_CONFIG[@]}"; do
    local file="$BU_PATH/src/$util.sh"
    [ -s $file ] && source $file
done
