#!/bin/bash

[ -z HOME ] && HOME=/home/$USER

#wget https://raw.githubusercontent.com/jmmcgee/scripts/master/config/bashrc -O $HOME/.bashrc
wget https://raw.githubusercontent.com/jmmcgee/scripts/master/config/gitconfig -O $HOME/.gitconfig
wget https://raw.githubusercontent.com/jmmcgee/scripts/master/config/vimrc -O $HOME/.vimrc

# set up vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

