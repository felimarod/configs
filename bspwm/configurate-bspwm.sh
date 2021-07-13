#!/bin/bash

# Author: felimarod

dotdirs=("bspwm" "sxhkd" "picom" "polybar")
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

function createLinks(){
	echo "hola"
}

# Main Function

if [ "$(id -u)" == "0" ]; then
  dependencies
  #createLinks
else
  echo -e "\n${redColour}[*] No soy root${endColour}\n"
fi
