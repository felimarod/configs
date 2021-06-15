#!/bin/bash

sudo apt install neovim -y

mkdir ~/.config/nvim
cp init.vim ~/.config/nvim

cp .vimrc ~/.vimrc

mkdir ~/.vim
mv autoload ~/.vim/autoload

echo "Ejecutar en neovim:"
echo "  :PlugInstall"
echo "  :CocInstall coc-java"


