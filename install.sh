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

mv ~/laynux ~/dotfiles
mv ~/.bashrc ~/.bashrc.bak
yay -Rns dunst
yay -Syu stow --noconfirm
stow $(find . -maxdepth 1 -type d -not -name "." | sed 's|^\./||')

mapfile -t packages < dep

yay -S --noconfirm --needed "${packages[@]}"

systemctl enable ly NetworkManager bluetooth
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Installation completed successfully! rebooting in 5"
sleep 5 && reboot
