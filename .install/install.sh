#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm base-devel

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

rm -f ~/.bashrc ~/.config/hypr/hyprland.conf
yay -Rns --noconfirm dunst nano
yay -Syu stow --noconfirm
cd ~/laynux
stow */
sudo stow -t /etc .ly
sudo stow -t /usr .grub_theme

mapfile -t packages < dep
yay -S --noconfirm --needed "${packages[@]}"

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless +"luafile ~/.config/nvim/lua/andy/packer.lua" +PackerSync +qa

sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
crontab ~/laynux/.install/cron
systemctl enable cronie tailscaled bluetooth 

sudo sed -i '/^GRUB_THEME=/d' /etc/default/grub 
echo 'GRUB_THEME="/usr/share/grub/themes/Xenlism-Arch/theme.txt"' | sudo tee -a /etc/default/grub
sudo sed -i '/^GRUB_TIMEOUT/d' /etc/default/grub
echo 'GRUB_TIMEOUT=1' | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Installation completed, rebooting"
sleep 1 && reboot
