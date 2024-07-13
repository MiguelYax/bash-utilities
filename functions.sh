#!/bin/bash

#################### FUNCTIONS #################### 
# log directory

function logd () {
  logDirectory=$(date +%Y-%m-%d)
  
  [ -n "$1" ] && logDirectory+="-$1"
  
  echo "Generating: $logDirectory"
  mkdir "$logDirectory" && cd "$logDirectory" || exit
}

#log file

logf () {
  fileName=$(date +%Y-%m-%d)
  
  [ -n "$1" ] && fileName+="-$1"
  
  vim "$fileName.log"
}

#################### git ####################

# git new feature
function gnf () {
  local name="$1"
  if  [ -z "$name" ];
  then 
    echo "Usage : $(basename "$0") <featureName>"
  else
    if [[ $name == "feature/"* ]];
    then
      git checkout -b "$name"
    else 
      git checkout -b "feature/$name" 
    fi
  fi
}

# git new issue
function gni () {
  local name="$1"
  if  [ -z "$name" ];
  then 
    echo "Usage : $(basename "$0") <issueName>"
  else         
    if [[ $name == "issue/"* ]];
    then
      git checkout -b "$name"
    else 
      git checkout -b "issue/$name" 
    fi
  fi
}


# git branch merge
function gbm() {
  local targetBranch='develop'

  [ -n "$1" ] && targetBranch=$1

  currentBranch=$(git branch --show-current) &&
  git pull &&
  git checkout "$targetBranch" &&
  git pull &&
  git checkout "$currentBranch" &&
  git merge "$targetBranch"
}

# git push branch
function gpb() {
  currentBranch=$(git branch --show-current) &&
  git push --set-upstream origin "$currentBranch"
}

# git add . and commit
function gac() {
  if  [[ $# -gt 3 ]];
  then 
    local message="$*"     
    git add . && git commit -m "$message"
  else 
    echo "Usage : $(basename "$0") <commitMessage>"
  fi
}

#################### shell ####################

function addTo() {
  if [[ $# == 3 ]];
  then
    currentDir=$(pwd)
    bashFile="$currentDir/$1"
    {
      echo ""
      echo "#################### $3 ####################"
      echo "[ -s $bashFile ] && source $bashFile"
    } >> "$2"
  else
    echo "Usage: $(basename "$0") <bashFile> <bashrcFile> <comment>"
  fi
}

# surfire reports finder
function sfr () {
  if [ -z "$1" ]
    then
      echo "Surfire-reports finder"
      echo "Usage : $(basename $0) <Class name>"
    else
      find "$(pwd -P)" -type f -name "*$1*.txt" | xargs code
    fi
}
