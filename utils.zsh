#!/bin/zsh
# Language UTF-8
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Editors
export EDITOR=vi
export GIT_EDITOR=vi

# History settings
export HISTFILE=$HOME/.zhistory
export HISTSIZE=50000
export SAVEHIST=10000

# Fix compilation issue for Rxml2
if [ -d "/usr/local/opt/libxml2" ]
then
  export PATH="/usr/local/opt/libxml2/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/libxml2/lib"
  export CPPFLAGS="-I/usr/local/opt/libxml2/include"
  export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
fi

## History command configuration
setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_ALL_DUPS   # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt INC_APPEND_HISTORY     # add commands to HISTFILE in order of execution
setopt SHARE_HISTORY          # share command history data
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# set private environment variables for project
function dotenv {
  ENV=${1:-.env}
  if [ -f $ENV ]; then
     set -o allexport && source ${ENV} set +o allexport
  else
     echo "$ENV does not exist"
  fi
}

function pyopencv {
  if (( ! $+commands[pipenv] ))
  then
     echo "pipenv does not exist."
     exit(1)
  fi

  if (( ! $+commands[opencv_version] )); then
     echo "OpenCV is not installed"
     exit(1)
  fi

  VENV=`pipenv --venv`
  VERSION=`ls $VENV/lib/ | grep python`
  ORIG=`brew ls opencv3 | grep $VERSION | grep .so | grep site-packages`
  ln -s $ORIG $VENV/lib/$VERSION/site-packages/cv2.so
}

function hist() {
  noglob fc -nl 0 | grep --color=auto "$@"
}

# Upgrade all outdated global packages
function ncu-g() {
  `ncu -g | grep "npm -g"`
}

function ssh_id(){
  ID="$HOME/.ssh/$1"
  if [ -f "$ID.pub" ]
  then
    ssh-add -D
    ssh-add $ID
  else
    echo "No SSH identity found for $ID"
  fi
  ssh-add -l
}

function dcc() {
  docker rmi -f $(docker images | grep "$1" | tr -s ' ' | cut -d ' ' -f 3)
}
# source <(tkn completion zsh)

alias git-sync="git pull && git checkout develop && git merge main && git push origin develop"
