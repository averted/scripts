#!/bin/bash
# OSX initialization script

# set default shell to bash
chsh -s /bin/bash

# keyboard settings
./keyboard.sh

# install xcode dev tools to use git
echo "Installing xcode dev tools.."
xcode-select --install

# fetch git dotfiles repo
mkdir -p ~/git
cd ~/git

git clone https://github.com/averted/dotfiles.git

# sync .vim
echo "Syncing: .vim"
cp -Rn ~/git/dotfiles/.vim ~

# sync .vimrc
echo "Syncing: .vimrc"
cp -n ~/git/dotfiles/.vimrc ~

# sync vim bundles
echo "Syncing: vim bundles"
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/vim-ctrlp
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/averted/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone https://github.com/elzr/vim-json.git ~/.vim/bundle/vim-json

# sync .bash_profile
echo "Syncing: .bash_profile"
cp -n ~/git/dotfiles/.bash_profile ~

# sync .bashrc
echo "Syncing: .bashrc"
cp -n ~/git/dotfiles/.bashrc ~

# sync .gitconfig
echo "Syncing: .gitconfig"
if cp -n ~/git/dotfiles/.gitconfig ~; then
  echo "- Dont forget to set email in .gitconfig!"
fi

# add git prompt script
echo "Creating dir: /usr/local/git/contrib/completion"
sudo mkdir -p /usr/local/git/contrib/completion
echo "Downloading: git-prompt.sh"
cd /usr/local/git/contrib/completion
sudo curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
cd ~/git

# download Hack font
echo "Downloading Hack font v3.003 (TODO: check for updated version!)"
cd $HOME/Downloads
sudo curl -O https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip

# download Firefox
echo "Downloading: Firefox"
cd $HOME/Downloads
command open -a Safari https://www.mozilla.org/en-US/firefox/new/

# download f.lux
echo "Downloading: f.lux"
cd $HOME/Downloads
sudo curl -O https://macflux.b-cdn.net/Flux.zip

# download Postgres
echo "Downloading: Postgres"
cd $HOME/Downloads
sudo curl -O https://github.com/PostgresApp/PostgresApp/releases/download/v2.6.7/Postgres-2.6.7-16.dmg

# download Kitty / Wez ?
echo "Downloading: kitty"
command open -a Safari https://github.com/kovidgoyal/kitty/releases

# add italics to vim
echo "Adding: Vim italics support"
mkdir ~/.terminfo
tic -o $HOME/.terminfo ~/git/dotfiles/.terminfo/tmux.terminfo
tic -o $HOME/.terminfo ~/git/dotfiles/.terminfo/tmux-256color.terminfo
tic -o $HOME/.terminfo ~/git/dotfiles/.terminfo/xterm-256color.terminfo

# add symbolic ln for scripts to home dir
echo "Adding: Symbolic scripts link"
ln -s ~/git/scripts ~/scripts

# disable npm package-lock globally
echo "NPM Config: Disable npm package-lock"
if [ -x "$(command -v npm)" ]; then
  npm config set package-lock false
else
  echo "-- [Error]: npm doesn't exist - Install Node.js: https://nodejs.org/en/"
  command open -a Safari https://nodejs.org/en/
fi

# install npm global packages
echo "NPM Global Packages"
if [ -x "$(command -v npm)" ]; then
  # echo "-- Installing: react-native-cli"
  # sudo npm install -g react-native-cli

  echo "-- Installing: n (nvm)"
  sudo npm install -g n

  echo "-- Installing: yarn"
  sudo npm install -g yarn
else
  echo "-- [Error]: npm doesn't exist - Install Node.js: https://nodejs.org/en/"
  command open -a Safari https://nodejs.org/en/
fi

# Rust
echo "Installing: rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

exit 0
