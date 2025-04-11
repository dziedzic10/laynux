#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm base-devel

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

rm ~/.bashrc ~/.config/hypr/hyprland.conf
yay -Rns dunst
yay -Syu stow --noconfirm
stow $(find . -maxdepth 1 -type d -not -name "." | sed 's|^\./||')

mapfile -t packages < dep

yay -S --noconfirm --needed "${packages[@]}"

systemctl enable tailscaled bluetooth

echo "Installation completed successfully! rebooting in 5"
sleep 5 && reboot
