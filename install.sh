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
yay -Rns dunst nano
yay -Syu stow --noconfirm
stow $(find . -maxdepth 1 -type d -not -name ".*" -not -name "." | sed 's|^\./||')

mapfile -t packages < dep

yay -S --noconfirm --needed "${packages[@]}"

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless +"luafile ~/.config/nvim/lua/andy/packer.lua" +PackerSync +qa

sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl enable tailscaled bluetooth waydroid-container

echo "Installation completed successfully! rebooting in 5"
sleep 5 && reboot
