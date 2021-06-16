#!/bin/bash

 apt install neovim -y

mkdir ~/.config
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim

cp .vimrc ~/.vimrc

mkdir ~/.vim
cp -r autoload ~/.vim/autoload

echo "Ejecutar en neovim:"
echo "  :PlugInstall"
echo "  :CocInstall coc-java"


