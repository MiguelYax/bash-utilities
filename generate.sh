#!/bin/bash

echo "Generating configuration..."
echo "#\!/bin/bash" > config.sh
echo "# BASH UTILITIES CONFIGURATION" >> config.sh

source ./functions.sh

addTo alias.sh ./config.sh "Alias file"
addTo functions.sh ./config.sh "Functions file"
addTo bonus.sh ./config.sh "Bonus file"
