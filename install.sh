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

# List of packages to install
cat > dependencies.txt <<EOL
stow
synology-drive
hyprpaper
hyprlock
waybar
hypridle
brightnessctl
dunst
hyprshot
ttf-font-awesome
ttf-cascadia-code-nerd
usbutils
nwg-look
pavucontrol
blueman
network-manager-applet
kdeconnect
catppuccin-gtk-theme-mocha
wlogout
nautilus
gvim
clipse
gwenview
thunderbird
hyprpicker
imagemagick
trash-cli
socat
zoxide
EOL

# Let user review and modify the package list
nano dependencies.txt

# Read the modified package list into an array
mapfile -t packages < dependencies.txt

# Install selected packages with yay
echo "Installing selected packages..."
yay -S --needed "${packages[@]}"

# Clean up
rm dependencies.txt

echo "Installation completed successfully!"
