#!/bin/bash

# Check if Homebrew is installed, if not install it
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

ZSH_EXEC="$(which zsh)"
if [ -z "$ZSH_EXEC" ]; then
    echo "zsh not found. Installing zsh using Homebrew..."
    brew install zsh
    ZSH_EXEC="$(which zsh)"
fi

mkdir -p ~/.dotfiles
cp -f "$(dirname "$0")/.zshrc" ~/.dotfiles/.zshrc
cp -f "$(dirname "$0")/utils.zsh" ~/.dotfiles/utils.zsh

# Check if symlink ~/.spaceshiprc.zsh exists, if not create it
if [ ! -f ~/.spaceshiprc.zsh ]; then
    cp -f "$(dirname "$0")/.spaceshiprc.zsh" ~/.spaceshiprc.zsh
fi

# Install packages and casks from Brewfile
brew bundle --file="$(dirname "$0")/Brewfile"

# Check if "source ~/.dotfiles/.zshrc" entry exists in ~/.zshrc, if not append it
if [ ! -f ~/.zshrc ]; then
   touch ~/.zshrc
fi
if ! grep -q "source ~/.dotfiles/.zshrc" ~/.zshrc; then
    echo "source ~/.dotfiles/.zshrc" >> ~/.zshrc
fi

# Check if current shell is not zsh, find zsh executable, and run it
if [ "$(basename "$SHELL")" != "zsh" ]; then
    if [ -n "$ZSH_EXEC" ]; then
        exec "$ZSH_EXEC"
    else
        echo "Could not execute ZSH. Please run it manually."
    fi
fi
