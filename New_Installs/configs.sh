#!/bin/bash
dotfiles=$HOME/.git/jwos-dotfiles
configs=$HOME/.git/jwos-dotfiles/.config

# MAKE MACHINE CONFIG DIRECTORIES
mkdir ~/.xmonad/
mkdir ~/.config/rofi/
mkdir ~/.config/xmobar/

if [ $1 = "copytorepo" ]
then
    # COPY XMONAD / XMOBAR CONFIGS
    cp -r ~/.xmonad/* $dotfiles/.xmonad/
    cp -r  ~/.xmonad/* $dotfiles/.xmonad/

    cp ~/.config/xmobar/* $configs/xmobar/
    cp -r ~/.local/bin $dotfiles/.local/

    # COPY ROFI CONFIGS
    cp -r ~/.config/rofi/* $configs/rofi/

    # COPY NITROGEN CONFIGS
    cp -r ~/.config/nitrogen/ $configs/nitrogen/
    
    # COPY DOOM CONFIGS
    cp -r ~/.doom.d/* $configs/.doom.d/

    # COPY BASH CONFIG
    cp ~/.bashrc $configs/bash/

    # COPY PULSEAUDIO CONFIGS
    cp -r /etc/pulse/* $configs/pulse/

    cd ~/.git/jwos-dotfiles/
    git add -A 
    git commit -m 'automatic update'
    git push
elif [ $1 = "copyfromrepo" ]
then
    # COPY XMONAD / XMONAD SCRIPTS / XMOBAR CONFIGS
    cp -r $dotfiles/.xmonad/* ~/.xmonad/
    cp $configs/xmobar/* ~/.config/xmobar/
    cp -r $dotfiles/.local/bin/ ~/.local/

    # COPY ROFI CONFIGS
    cp -r $configs/rofi/* ~/.config/rofi/

    # COPY NITROGEN CONFIGS
    cp -r $configs/nitrogen/* ~/.config/nitrogen/

    # COPY DOOM CONFIGS
    cp -r $configs/.doom.d/* ~/.doom.d/

    # COPY BASH CONFIG
    cp $configs/bash/.bashrc ~/

    # COPY PULSEAUDIO CONFIGS
    sudo cp -r $configs/pulse/* /etc/pulse/
else
    echo 'Input not correct. Please try again'
    exit 1
fi
