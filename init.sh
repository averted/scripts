#!/bin/bash
# OSX initialization script

# keyboard settings
./setup.sh

# fetch git dotfiles repo
mkdir -p ~/git
cd ~/git
git clone git@github.com:averted/dotfiles.git

# sync .vim
cp -Rn ~/git/dotfiles/.vim ~

# sync .vimrc
cp -n ~/git/dotfiles/.vimrc ~

# sync .bash_profile
cp -n ~/git/dotfiles/.bash_profile ~

# sync .bashrc
cp -n ~/git/dotfiles/.bashrc ~

# sync .gitconfig
if cp -n ~/git/dotfiles/.gitconfig ~; then
  echo - Dont forget to set email in .gitconfig!
fi

exit 0