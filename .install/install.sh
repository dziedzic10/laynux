#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm base-devel

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

rm ~/.bashrc ~/.config/hypr/hyprland.conf
yay -Rns dunst nano
yay -Syu stow --noconfirm
cd ~/laynux
stow */
sudo stow -t /etc .ly

mapfile -t packages < dep

yay -S --noconfirm --needed "${packages[@]}"

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless +"luafile ~/.config/nvim/lua/andy/packer.lua" +PackerSync +qa

sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl enable cronie tailscaled bluetooth waydroid-container

echo "Installation completed, rebooting"
sleep 1 && reboot
