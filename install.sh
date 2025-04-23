#!/bin/bash

cp -r .config ~/.config || echo "Could not copy .config dir" ; exit 1

ln -s ~/.config .config
rm -rf .vimrc
touch .vimrc
ln -s ~/.config/vim/vimrc .vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
