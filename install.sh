#!/bin/bash

function link_dotfile() {
  echo "Linking dotfiles"
  
  if [ -f ~/.tmux.conf ]; then
    rm ~/.tmux.conf
  fi

  if [ -f ~/.vimrc ]; then
    rm ~/.vimrc
  fi

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
elif [ "${1}" = "install" ] || [ -z "${1}" ]; then
  install
  link_dotfile
fi


