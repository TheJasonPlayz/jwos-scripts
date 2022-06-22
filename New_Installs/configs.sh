#!/bin/bash
dotfiles=$HOME/.git/jwos-dotfiles
configs=$HOME/.git/jwos-dotfiles/.config

# MAKE MACHINE CONFIG DIRECTORIES
mkdir ~/.xmonad/
mkdir ~/.config/rofi/

if [ $1 = "copytorepo" ]
then
    # COPY XMONAD / XMOBAR CONFIGS
    cp ~/.xmonad/xmonad.hs $dotfiles/.xmonad/
    cp ~/.xmobarrc $configs/xmobar/

    # COPY ROFI CONFIGS
    cp -r ~/.config/rofi/* $configs/rofi/

    # COPY NITROGEN CONFIGS
    cp -r ~/.config/nitrogen/ $configs/nitrogen/
    
    # COPY DOOM CONFIGS
    cp -r ~/.doom.d/* $configs/.doom.d/

    # COPY BASH CONFIG
    cp ~/.bashrc $configs/bash/
elif [ $1 = "copyfromrepo" ]
then
    # COPY XMONAD / XMOBAR CONFIGS
    cp $dotfiles/.xmonad/xmonad.hs ~/.xmonad/
    cp $configs/xmobar/.xmobarrc ~/

    # COPY ROFI CONFIGS
    cp -r $configs/rofi/* ~/.config/rofi/

    # COPY NITROGEN CONFIGS
    cp -r $configs/nitrogen/* ~/.config/nitrogen/

    # COPY DOOM CONFIGS
    cp -r $configs/.doom.d/* ~/.doom.d/

    # COPY BASH CONFIG
    cp $configs/bash/.bashrc ~/
else
    echo 'Input not correct. Please try again'
    exit 1
fi
