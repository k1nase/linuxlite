#!bin/bash

B=$(tput bold)
N=$(tput sgr0)

echo "${B}##Suppression du snap firefox##${N}"
sudo snap disable firefox
sudo snap remove --purge firefox

echo "${B}##Installation flatpak##${N}"
sudo apt install flatpak -y

echo "${B}##Configuration flathub##${N}"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${B}##Installation logithèque + gestion flatpak##${N}"
sudo apt install gnome-software gnome-software-plugin-flatpak -y

echo "${B}##Installation firefox par flatpak##${N}"
sudo flatpak install org.mozilla.firefox/x86_64/stable -y

echo "${B}##Installation autres paquets##${N}"
sudo apt install geogebra xcas texlive-full texmaker pyzo python3-pip python3-scipy python3-matplotlib

echo "${B}##Désinstallation snaps##${N}"
sudo snap remove firmware-updater snap-store
sudo snap remove gtk-common-themes gnome-42-2204 snapd-desktop-integration
sudo snap remove core22 bare
sudo snap remove snapd

sudo apt autoremove snapd

sudo touch /etc/apt/preferences.d/nosnap
echo 'Package: snapd' >> /etc/apt/preferences.d/nosnap
echo 'Pin: release *' >> /etc/apt/preferences.d/nosnap
echo 'Pin-Priority: -1' >> /etc/apt/preferences.d/nosnap


echo 'export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"' >> ~/.profile
