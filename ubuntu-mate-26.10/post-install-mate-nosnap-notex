#!bin/bash

B=$(tput bold)
N=$(tput sgr0)

echo "${B}##Désinstallation snaps##${N}"
sudo snap disable firefox
sudo snap remove --purge firefox
sudo snap remove firmware-updater snap-store
sudo snap remove gtk-common-themes gnome-42-2404 snapd-desktop-integration
sudo snap remove core24 bare mesa-2404
sudo snap remove snapd

sudo apt autoremove snapd -y

sudo touch /etc/apt/preferences.d/nosnap
echo 'Package: snapd' | sudo tee -a /etc/apt/preferences.d/nosnap
echo 'Pin: release *' | sudo tee -a /etc/apt/preferences.d/nosnap
echo 'Pin-Priority: -1' | sudo tee -a /etc/apt/preferences.d/nosnap

echo "${B}##Installation flatpak##${N}"
sudo apt install flatpak -y

echo "${B}##Configuration flathub##${N}"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${B}##Installation logithèque + gestion flatpak##${N}"
sudo apt install gnome-software gnome-software-plugin-flatpak -y

echo "${B}##Installation firefox par flatpak##${N}"
sudo flatpak install org.mozilla.firefox/x86_64/stable -y

echo "${B}##Installation autres paquets##${N}"
sudo apt install geogebra xcas pyzo python3-pip python3-scipy python3-matplotlib

echo 'export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"' >> ~/.profile
