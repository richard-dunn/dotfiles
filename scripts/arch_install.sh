#!/bin/bash

# git will be installed before running this and dotfiles will be downloaded to ~/dotfiles/
# this script will be in ~/dotfiles/scripts/

# Ensure script is run as a non-root user
if [ "$EUID" -eq 0 ]; then
  echo "Please do not run as root"
  exit
fi

# Update the system
sudo pacman -Syu --noconfirm

# Make sure basic utilities are installed
sudo pacman -S --noconfirm base-devel openssl libffi zlib

# Install Timeshift
sudo pacman -S --noconfirm timeshift

# Record initial snapshot with Timeshift
if command -v timeshift &> /dev/null
then
  sudo timeshift --create --comments "Initial post-install snapshot"
fi

# Install drivers for Thinkpad T480
sudo pacman -S --noconfirm intel-ucode xf86-video-intel iwlwifi firmware sof-firmware acpi acpi_call tlp

# Enable TLP for power management
sudo systemctl enable tlp
sudo systemctl start tlp

# Change shell to Zsh and symlink .zshrc
chsh -s /bin/zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Install tmux and symlink config files
sudo pacman -S --noconfirm tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# Install Neovim and symlink config files
sudo pacman -S --noconfirm neovim
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/.config/nvim/lua ~/.config/nvim/lua

# Install Wayland, Hyprland, Hyprpaper, Waybar and symlink config files
sudo pacman -S --noconfirm wayland xorg-server-xwayland wayland-protocols hyprland-git hyprpaper waybar
ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
ln -sf ~/dotfiles/.config/waybar ~/.config/waybar  # Adjusted to match common waybar directory

# Install Kitty and symlink config files
sudo pacman -S --noconfirm kitty
ln -sf ~/dotfiles/.config/kitty ~/.config/kitty

# Install Wofi and symlink config files
sudo pacman -S --noconfirm wofi
ln -sf ~/dotfiles/.config/wofi ~/.config/wofi

# Install Firefox
sudo pacman -S --noconfirm firefox

# Install Bluetooth utilities
sudo pacman -S --noconfirm bluez bluez-utils pulseaudio-bluetooth
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Install Docker
sudo pacman -S --noconfirm docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Install Node.js and npm
sudo pacman -S --noconfirm nodejs npm

# Install rbenv and ruby-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install Ruby and Bundler
rbenv install 3.1.2
rbenv global 3.1.2
gem install bundler
rbenv rehash

echo "Installation and configuration complete! Please reboot for all changes to take effect."
