#!/bin/bash
# Automatic instalation script of adamos - Void linux based operation system with dwm, st, ranger ... for personal use of Adam Krivka
# IMPORTANT: Make sure you run this script as the default user (you) and as 'sudo'

# %%%%%
echo "Cloning dotfiles from github."
cd /home/adam
git clone --depth 1 https://github.com/aidam38/adamos_void /home/adam &>/dev/null

# %%%%%
echo "Disabling services for obsolete ttys" 
cd /var/service
rm -f agetty-tty3 & rm -f agetty-tty4 & rm -f agetty-tty5 & rm -f agetty-tty6 &>/dev/null

# %%%%%
echo "Disabling grub os prober and setting up automatic login"
cp -R /home/adam/scripts/install/agetty-autologin-tty1 /etc/sv/ &>/dev/null
ln -s /etc/sv/agetty-autologin-tty1 /var/service 
rm /var/service/agetty-tty1 &>/dev/null

cp -f /home/adam/scripts/install/grub /etc/default/grub
update-grub &>/dev/null

# %%%%%
echo "Allowing user to run reboot, poweroff and shutdown without password"
cp -f /home/adam/scripts/install/sudoers /etc/sudoers

# Synchronizing the package system and installing basic programs
xbps-install -Suv &>/dev/null
while IFS=, read -r program; do
	echo "(xbps) Installing " $program
	xbps-install -Sy $program &>/dev/null
done;

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
