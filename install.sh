#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim


echo "create .vimrc"
rm ~/.vimrc
rm ~/.gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.gvimrc
rm ~/.gitconfig

ln -s ~/.vim/.gitconfig ~/.gitconfig




echo "update submodules"
git submodule init
git submodule update

echo "remove lua-ftplugin to prevent doc error msg"

rm bundle/vim-lua-ftplugin/doc/lua-ftplugin.txt

git submodule foreach git pull origin master
