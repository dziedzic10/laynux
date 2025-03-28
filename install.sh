#!/bin/bash

set -e

# Update system
sudo pacman -Syu --noconfirm

# Install base dependencies
echo "Installing base dependencies..."
sudo pacman -S --needed git base-devel

# Install yay (AUR helper) if not installed
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
else
    echo "yay is already installed."
fi

yay -Syu stow --noconfirm
stow $(find . -maxdepth 1 -type d -not -name "." | sed 's|^\./||')

mapfile -t packages < dep

yay -S --noconfirm --needed "${packages[@]}"

if systemctl list-unit-files | grep -q "NetworkManager.service"; then
    systemctl enable NetworkManager
fi
if systemctl list-unit-files | grep -q "bluetooth.service"; then
    systemctl enable bluetooth
fi

echo "Installation completed successfully! rebooting in 5"
sleep 5 && reboot
