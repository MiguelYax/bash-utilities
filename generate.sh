#!/bin/bash

echo "Generating configuration..."
CONFIG_FILE="./config.sh"

{
  echo "#!/bin/bash"
  echo ""
  echo "# BASH UTILITIES CONFIGURATION"
} > "$CONFIG_FILE"

source ./functions.sh

addTo alias.sh "$CONFIG_FILE" "Alias file"
addTo functions.sh "$CONFIG_FILE" "Functions file"
addTo bonus.sh "$CONFIG_FILE" "Bonus file"
addTo spaceship.sh "$CONFIG_FILE" "Spaceship prompt file"
## addTo volta.sh "$CONFIG_FILE" "Volta enhance for nvmrc file"
