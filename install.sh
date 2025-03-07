#!/bin/bash

set -e

# Update system
sudo pacman -Syu

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

yay -S stow
stow *

# List of packages to install
cat > dependencies.txt <<EOL
hyprland-git
hyprlock
hypridle
hyprpicker
hyprpaper
hyprshot
hyprpolkitagent

ttf-font-awesome
ttf-cascadia-code-nerd
catppuccin-gtk-theme-mocha
nwg-look

waybar
nautilus
pavucontrol
brightnessctl
bluez
networkmanager
blueman
network-manager-applet
wlogout
dunst
clipse
imagemagick
synology-drive
kdeconnect
thunderbird
gparted
trash-cli
usbutils
zoxide
EOL

# Let user review and modify the package list
nano dependencies.txt

# Read the modified package list into an array
mapfile -t packages < dependencies.txt

# Install selected packages with yay
echo "Installing selected packages..."
yay -S --needed "${packages[@]}"

systemctl enable NetworkManager
systemctl enable bluetooth

# Clean up
rm dependencies.txt

echo "Installation completed successfully!"
