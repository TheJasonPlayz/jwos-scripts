#!/bin/bash
dotfiles=$HOME/.git/dotfiles

# MAKE MACHINE CONFIG DIRECTORIES
mkdir ~/.xmonad/
mkdir ~/.config/rofi/

if [ $1 = "copytorepo" ]
then
    # COPY XMONAD / XMOBAR CONFIGS
    cp ~/.xmonad/xmonad.hs $dotfiles/.xmonad/
    cp ~/.xmobarrc $dotfiles/configs/xmobar/

    # COPY ROFI CONFIGS
    cp ~/.config/rofi/config.rasi $dotfiles/configs/rofi/

    # COPY NITROGEN CONFIGS
    cp -r ~/.config/nitrogen/ $dotfiles/configs/nitrogen/
    
    # COPY DOOM CONFIGS
    cp -r ~/.doom.d/ $dotfiles/configs/doom/

    # COPY BASH CONFIG
    cp ~/.bashrc $dotfiles/configs/bash/
elif [ $1 = "copyfromrepo" ]
then
    # COPY XMONAD / XMOBAR CONFIGS
    cp $dotfiles/.xmonad/xmonad.hs ~/.xmonad/
    cp $dotfiles/configs/xmobar/.xmobarrc ~/

    # COPY ROFI CONFIGS
    cp $dotfiles/configs/rofi/config.rasi ~/.config/rofi/

    # COPY NITROGEN CONFIGS
    cp -r $dotfiles/configs/nitrogen/ ~/.config/nitrogen/

    # COPY DOOM CONFIGS
    cp -r $dotfiles/configs/doom/.doom.d ~/.doom.d/

    # COPY BASH CONFIG
    cp $dotfiles/configs/bash/.bashrc ~/
else
    echo 'Input not correct. Please try again'
    exit 1
fi
