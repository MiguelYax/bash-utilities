#!/bin/bash

#################### FUNCTIONS #################### 
# log directory

function logd () {
  local logDirectory=$(date +%Y-%m-%d)
  
  [ ! -z "$1" ] && logDirectory+="-$1"
  
  echo "Generating: $logDirectory"
  mkdir $logDirectory && cd $logDirectory
}

#log file

logf () {
  local fileName=$(date +%Y-%m-%d)
  
  [ ! -z "$1" ] && fileName+="-$1"
  
  vim "$fileName.log"
}

#################### git ####################

# git new feature
function gnf () {
  local name="$1"
  if  [[ "$name" == "" ]];
  then 
    echo "Usage : $(basename $0) <featureName>"
  else         
    git checkout -b "feature/$name" 
  fi
}

# git branch merge
function gbm() {
  local targetBranch='develop'

  [ ! -z "$1" ] && targetBranch=$1

  local currentBranch=$(git branch --show-current) &&
  git pull &&
  git checkout $targetBranch &&
  git pull &&
  git checkout $currentBranch &&
  git merge $targetBranch
}

# git push branch
function gpb() {
  currentBranch=$(git branch --show-current) &&
  git push --set-upstream origin $currentBranch
}

# git add . and commit
function gac() {
  if  [[ $# -gt 3 ]];
  then 
    local message="$*"     
    git add . && git commit -m "$message"
  else 
    echo "Usage : $(basename $0) <commitMessage>"
  fi
}

#################### shell ####################

function addTo() {
  if [[ $# == 3 ]];
  then
    local currentDir=$(pwd)
    local bashFile="$currentDir/$1"
    echo "" >> "$2"
    echo "#################### $3 ####################" >> "$2"
    echo ""'[ -s '"$bashFile"' ] && \. '"$bashFile"'' >> "$2"
  else
    echo "Usage: $(basename $0) <bashFile> <bashrcFile> <comment>"
  fi
}

