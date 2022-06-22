#!/bin/bash
install_aur() 
{
	if [[ ! -d "~/AUR/" ]]
	then
		mkdir ~/AUR/
	fi
	
	git clone https://aur.archlinux.org/$1.git ~/AUR/$1
	
	cd ~/AUR/$1/
	makepkg --noconfirm -si 
	
	cd ~/AUR/
	rm -rf $1/
}

if [ "$(id -u)" = 0 ]; then
    echo "##################################################################"
    echo "This script MUST NOT be run as root user since it makes changes"
    echo "to the \$HOME directory of the \$USER executing this script."
    echo "The \$HOME directory of the root user is, of course, '/root'."
    echo "We don't want to mess around in there. So run this script as a"
    echo "normal user. You will be asked for a sudo password when necessary."
    echo "##################################################################"
    exit 1
fi

grep -v " " ./lists/main_pkglist.txt > ~/.main.txt
grep -v " " ./lists/aur_pkglist.txt > ~/.aur.txt
grep -v " " ./lists/single_aur_pkglist.txt > ~/.single.aurs.txt

sudo pacman --needed --ask 4 -Sy - < ~/.main.txt

install_aur yay
yay -Say --needed --useask --ask 4 - < ~/.aur.txt

yay -S - < ~/.single.aurs.txt

rm -rf ~/.main.txt ~/.aur.txt ~/.single.aurs.txt

#source ./config.sh
