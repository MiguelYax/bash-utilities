#!/bin/bash

#################### ALIAS #################### 

# GIT
alias gch='git checkout '
alias gco='git commit -m '
alias gs='git status '
alias gb='git branch --all'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short '
alias glo='git log  --oneline -n '
alias ga='git add '
alias gd='git dif '
alias gp='git push '
alias gcl='git clone '
alias grh='git reset --hard HEAD'

## DOCKER

alias dkps="docker ps"
alias dkst="docker ps -a -q | xargs docker stop"
alias dkrm="docker ps -a -q | xargs docker rm"
alias dkfn='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"'
alias dkfs='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}"'

## NODE

alias ns="npm start "
alias nr="npm run "
alias nt="npm test "
alias nrc="npm run coverage"
alias nrco="npm run coverage:open"
alias nrb="npm run build"
alias ni="npm install "
alias nid="npm install --save-dev "
alias nu="npm uninstall "
alias nig="npm install --global "
alias nug="npm uninstall --global "
alias nci="npm ci "
alias nrl="npm run lint "
alias nlf="npm run lint:fix "

## UTILS

alias ls="exa --icons  --group-directories-first "
