#!/bin/bash

# TMPDIR=$(mktemp -d)
# CURRENT=$PWD

# cd $TMPDIR
# for script in ~/.dotfiles/scripts/*; do
#   bash "$script"
# done

# cd $CURRENT
# rm -rf $TMPDIR

sudo chsh -s $(brew --prefix)/bin/zsh
mkdir ~/.nvm