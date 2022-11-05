#!/bin/bash

function link_dotfile() {
  echo "Linking dotfiles"

  rm ~/.tmux.conf
  rm ~/.vimrc

  ln -s $(pwd)/tmux.conf ~/.tmux.conf
  ln -s $(pwd)/vimrc ~/.vimrc
}

function install() {
  echo "installing..."
  
  sudo apt install -y tmux
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function backup() {
  echo "backup setting of tmux, vim"

  cp ~/.vimrc ./vimrc
  cp ~/.tmux.conf ./tmux.conf
}

if [[ "${1}" = "backup" ]]; then
  backup  
fi

if [ "${1}" = "install" ]; then
  install
  link_dotfile
fi


