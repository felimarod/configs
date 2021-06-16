#!/bin/bash

sudo apt install zsh -y

#OhMyZsh
bash install-OhMyZsh.sh

#PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

mv .zshrc ~/.zshrc 

echo "Instalar las fuentes dando click y configurarla en la terminal, sea gnome-terminal u otra"

exec zsh -l
