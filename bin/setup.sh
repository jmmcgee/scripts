#!/bin/bash

[ -z HOME ] && HOME=/home/$USER

cd $HOME
git clone https://github.com/jmmcgee/scripts

cp -i scripts/config/bashrc $HOME/.bashrc
cp -i scripts/config/gitconfig $HOME/.gitconfig
cp -i scripts/config/vimrc $HOME/.vimrc

rm -rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

