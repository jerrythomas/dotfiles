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
echo "source ~/.dotfiles/.zshrc" >>! ~/.zshrc
$(brew --prefix)/bin/zsh