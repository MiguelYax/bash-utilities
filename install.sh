if [[ "$1" == "" ]];
then 
  echo "Usage: bash +x install.sh <targetFile>"
  echo "Example:"
  echo "         ./install.sh ~/.bashrc"
  echo "         ./install.sh ~/.zshrc"
else
  echo "Generating configuration..."
  echo "#\!/bin/bash" > config.sh
  echo "# BASH UTILITIES CONFIGURATION" >> config.sh

  source ./functions.sh

  addTo alias.sh ./config.sh "Alias file"
  addTo functions.sh ./config.sh "Functions file"

  echo "Adding configuration to $1"
  addTo config.sh $1 "Bash utilities configuration"
fi
