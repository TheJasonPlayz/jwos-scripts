#!/bin/bash

git config --global user.email "thejasonplayz@gmail.com"
git config --global user.name "TheJasonPlayz"

# REMOVE LIGHTDM CACHE
sudo rm -r /var/cache/lightdm

#INSTALL DOOM EMACS
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

#INSTALL BACKGROUNDS / USER DIRS
xdg-user-dirs-update
git clone https://gitlab.com/dwt1/wallpapers.git ~/Pictures/Backgrounds

#UNMUTE ALSA
amixer sset Master unmute
