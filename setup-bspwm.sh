#!/bin/bash

# Author: felimarod

dir="${HOME}/.dotfiles"

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

export DEBIAN_FRONTEND=noninteractive

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
	tput cnorm;
  exit 0
}

function dependencies(){
  tput civis
  clear
	dependencies=(bspwm sxhkd picom polybar)
  echo -e "${yellowColour}[*]${endColour}${grayColour} Comprobando programas necesarios...${endColour}"

	declare -i counter=0
  for program in "${dependencies[@]}"; do
		echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Herramienta${endColour}${purpleColour} $program${endColour}${blueColour}...${endColour}"

		test -f /usr/local/bin/$program

		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${greenColour}(V)${endColour}"
		else
			echo -e " ${redColour}(X)${endColour}\n"
			echo -e "${yellowColour}[*]${endColour}${grayColour} Instalando herramienta ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
			let counter+=1
		fi; sleep 1
	done

	if [ $counter -ne 0 ]; then
		echo -e "${redColour}[*] Faltan dependencias.${endColour}"
		exit 0
	fi
}

function createLinksDirs(){
	dotdirs=("bspwm" "sxhkd" "picom" "polybar")

  for dotdir in "${dotdirs[@]}";do
		ln -sf -d "${dir}/${dotdir}" "${HOME}/.config/${dotdir}"
	done
}

# Main Function

  dependencies
	createLinksDirs
