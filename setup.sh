#!/bin/bash

# TMPDIR=$(mktemp -d)
# CURRENT=$PWD

# cd $TMPDIR
# for script in ~/.dotfiles/scripts/*; do
#   bash "$script"
# done

# cd $CURRENT
# rm -rf $TMPDIR

ln -s ~/.dotfiles/.spaceshiprc.zsh ~/.spaceshiprc.zsh
mkdir ~/.nvm
$(brew --prefix)/bin/zsh