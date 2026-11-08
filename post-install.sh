#!bin/bash

B=$(tput bold)
N=$(tput sgr0)


echo "${B}##Installation flatpak##${N}"

sudo apt install flatpak -y

echo "${B}##Configuration flathub##${N}"

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${B}##Installation logithèque + gestion flatpak##${N}"

sudo apt install gnome-software gnome-software-plugin-flatpak -y

echo 'export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"' >> ~/.profile

sudo reboot
