#!/bin/bash
# Automatic instalation script of adamos - Void linux based operation system with dwm, st, ranger ... for personal use of Adam Krivka
# IMPORTANT: Make sure you run this script as the default user (you) and as 'sudo'

# Disabling services for obsolete ttys
cd /var/service
rm -f agetty-tty3 & rm -f agetty-tty4 & rm -f agetty-tty5 & rm -f agetty-tty6 

# Synchronizing the package system and installing basic programs
xbps-install -Suv
xbps-install -Sy nvim ranger qutebrowser feh
xbps-install -Sy git make xorg-minimal xorg-fonts xf86-video-intel base-devel libX11-devel libXft-devel libXinerama-devel

# Installing dwm, st and dmenu from my git repositories (some programs are my own forks)
cd /home/adam
mkdir builds
cd builds

echo "Installing Dynamic Window Manager (dwm) from https://github.com/aidam38/dwm.git"
git clone https://github.com/aidam38/dwm.git
cd dwm
sudo make clean install

cd ..

echo "Installing Simple Terminal (st) from https://github.com/aidam38/st.git"
git clone https://github.com/aidam38/st.git
cd st
sudo make clean install

cd ..

echo "Installing dmenu from git.suckless.org/dmenu"
git clone git://git.suckless.org/dmenu
cd dmenu
sudo make clean install

cd /home/adam

# Disabling grub login menu and setting up automatic login
cp -R /home/adam/scripts/install/agetty-autologin-tty1 /etc/sv/
ln -s /etc/sv/agetty-autologin-tty1 /var/service
rm /var/service/agetty-tty1
