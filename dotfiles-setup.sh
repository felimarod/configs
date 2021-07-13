#!/bin/bash
dotfiles=(".zshrc" ".p10k.zsh" ".gitconfig")
dir="${HOME}/.dotfiles"
for dotfile in "${dotfiles[@]}";do
 ln -sf "${dir}/${dotfile}" "${HOME}"
done
