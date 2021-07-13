#!/bin/bash
dotfiles=(".zshrc" ".gitconfig")
dir="${HOME}/.dotfiles"

ln -sf -d "${dir}/nvim" "${HOME}/.config/nvim"

for dotfile in "${dotfiles[@]}";do
 ln -sf "${dir}/${dotfile}" "${HOME}"
done
