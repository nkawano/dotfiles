#!/bin/sh

mkdir -p ~/.vim/bundle
mkdir  ~/.vim/undo
mkdir  ~/.vim/colors
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/tomasr/molokai.git
ln -s ~/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
./dotfilesLink.sh
