#!/bin/bash
# OSX initialization script

# keyboard settings
./setup.sh

# fetch git dotfiles repo
mkdir -p ~/git
cd ~/git

git clone git@github.com:averted/dotfiles.git
git clone git@github.com:averted/walls.git

# sync .vim
echo "Syncing: .vim"
cp -Rn ~/git/dotfiles/.vim ~

# sync .vimrc
echo "Syncing: .vimrc"
cp -n ~/git/dotfiles/.vimrc ~

# sync .bash_profile
echo "Syncing: .bash_profile"
cp -n ~/git/dotfiles/.bash_profile ~

# sync .bashrc
echo "Syncing: .bashrc"
cp -n ~/git/dotfiles/.bashrc ~

# sync walls
echo "Syncing: Desktop Pictures"
sudo cp -n ~/git/walls/* /Library/Desktop\ Pictures/

# sync .gitconfig
echo "Syncing: .gitconfig"
if cp -n ~/git/dotfiles/.gitconfig ~; then
  echo - Dont forget to set email in .gitconfig!
fi

# disable npm package lock globally
echo "Disable npm package-lock"
npm config set package-lock false

exit 0
