curl -O https://blackarch.org/strap.sh ~/

echo 6424ecf8d2e376c42b0db7fd38c87a8d2f32a7b5 ~/strap.sh | sha1sum -c

cd ~/
chmod +x ~/strap.sh

sudo ~/strap.sh

sudo pacman -Syyu
