#!/bin/bash

mkdir ~/.dotfiles
ln -s ~/.dotfiles/.spaceshiprc.zsh ~/.spaceshiprc.zsh
ln -s ~/.dotfiles/utils.zsh ~/utils.zsh
mkdir ~/.nvm
echo "source ~/.dotfiles/.zshrc" >>! ~/.zshrc
$(brew --prefix)/bin/zsh
