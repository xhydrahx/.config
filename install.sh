#!/bin/bash

cp -r .config ~/.config || echo "Could not copy .config dir" ; exit 1

ln -s ~/.config .config
ln -s ~/.config/vim/vimrc .vimrc
