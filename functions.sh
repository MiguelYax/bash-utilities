#!/bin/bash

#################### GLOBAL #################### 

BLANK="";


#################### FUNCTIONS #################### 
# log directory
ld () {
  d=$(date +%Y%m%d)

  if  [[ "$1" == "$BLANK" ]];
  then 
    fileName="$d"
  else 
    fileName="$d-$1"
  fi
  
  echo "$fileName"

  mkdir "$fileName" && cd "$fileName"
}

#LOG FILE

lf () {
  d=$(date +%Y%m%d)

  if  [[ "$1" == "$BLANK" ]];
  then 
    fileName="$d.log"
  else 
    fileName="$d-$1.log"
  fi

  vim "$fileName"
}

tf () {
  d=$(date +%Y%m%d%H%M)

  if  [[ "$1" == "$BLANK" ]];
  then 
    fileName="$d.txt"
  else 
    fileName="$d.$1"
  fi

  vim "$fileName"
}

fd () {
  if  [[ "$1" == "$BLANK" ]];
  then 
    echo "Usage: fd <fileName>"
  else 
    find . -iname "*$1*"
  fi
}


sshkey () {
  if  [[ "$1" == "$BLANK" ]];
  then 
    echo "Usage: sshkey <email>"
  else 
    ssh-keygen -t rsa -b 4096 -C "$1"
  fi    
}

#################### git ####################

gnf () {
  if  [[ "$1" == "$BLANK" ]];
  then 
    echo "Usage : $(basename $0) <featureName>"
  else         
    git checkout -b "feature/$1" 
  fi
}

gbm() {
  if  [[ "$1" == "$BLANK" ]];
  then
    targetBranch="develop"
  else 
    targetBranch=$1
  fi

  currentBranch=$(git branch --show-current) &&
  git pull &&
  git checkout $targetBranch &&
  git pull &&
  git checkout $currentBranch &&
  git merge $targetBranch
}

gpb() {
  currentBranch=$(git branch --show-current) &&
  git push --set-upstream origin $currentBranch
}

gac() {
  if  [[ $# -gt 3 ]];
  then 
    message="$*"     
    git add . && git commit -m "$message"
  else 
    echo "Usage : $(basename $0) <commitMessage>"
  fi
}

#################### shell ####################

addTo() {
  if [[ $# == 3 ]];
  then
    currentDir=$(pwd)
    bashFile="$currentDir/$1"
    echo "\n## $3" >> "$2"
    echo ""'[ -s '"$bashFile"' ] && \. '"$bashFile"'' >> "$2"
  else
    echo "Usage: $(basename $0) <bashFile> <bashrcFile> <comment>"
  fi
}

