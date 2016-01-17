#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim


echo "create .vimrc"
rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc

rm ~/.tmux.conf
ln -s ~/.vim/tmux.conf ~/.tmux.conf

#rm ~/.gitconfig
#ln -s ~/.vim/.gitconfig ~/.gitconfig


echo "update submodules"
git submodule init
git submodule update

