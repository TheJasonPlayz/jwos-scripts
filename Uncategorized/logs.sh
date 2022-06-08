#!/bin/bash

copypath=/mnt/sf/

cp /var/log/lightdm/lightdm.log $copypath
cp /var/log/lightdm/seat0-greeter.log $copypath
cp /var/log/lightdm/x-0.log $copypath
cp /var/log/Xorg.0.log $copypath