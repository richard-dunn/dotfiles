#!/bin/bash

# Ensure script is run as a non-root user
if [ "$EUID" -eq 0 ]; then
  echo "Please do not run as root"
  exit
fi

install_packages() {
  local packages=("$@")
  
  for package in "${packages[@]}"; do
    if pacman -Qi "$package" &> /dev/null; then
      echo "$package is already installed, skipping."
    else
      yay -S --noconfirm "$package"
    fi
  done
}

symlink_dotfiles() {
  local source_dir="$1"
  local dest_dir="$2"
  local files=("${@:3}")

  for file in "${files[@]}"; do
    local source_file="$source_dir/$file"
    local dest_file="$dest_dir/$file"

    if [ -L "$dest_file" ] && [ "$(readlink "$dest_file")" == "$source_file" ]; then
      echo "Symlink for $file already exists and is correct, skipping."
    else
      ln -sf "$source_file" "$dest_file"
      echo "Symlinked $source_file to $dest_file"
    fi
  done
}

enable_and_start_services() {
  local services=("$@")

  for service in "${services[@]}"; do
    sudo systemctl enable "$service"
    sudo systemctl start "$service"
  done
}

install_yay() {
  if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
  fi
}

# Install yay if not already installed
install_yay

# System update
sudo pacman -Syu --noconfirm

# Install base packages
base_packages=(
  base-devel bash-completion bc sudo intel-ucode xf86-video-intel
)
install_packages "${base_packages[@]}"

# Install utility packages
utilities=(
  tree cmatrix fzf less neofetch tmux wofi wl-clipboard libnotify timeshift tlp ufw
)
install_packages "${utilities[@]}"

# Install development tools
development_tools=(
  git nodejs npm postgresql-libs neovim libyaml docker
)
install_packages "${development_tools[@]}"

# Install environmental packages
environmental_packages=(
  chromium dolphin firefox greetd hypridle hyprland hyprlock hyprpaper kitty 
  networkmanager network-manager-applet blueman bluez bluez-utils pipewire 
  pipewire-pulse wireplumber waybar wayland-protocols xorg-server-xwayland pavucontrol
)
install_packages "${environmental_packages[@]}"

# Install fonts
fonts=(
  noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-dejavu ttf-font-awesome ttf-ms-fonts ttf-roboto
)
install_packages "${fonts[@]}"

# Enable and start necessary services
enable_and_start_services tlp ufw bluetooth docker

# Symlink dotfiles
symlink_dotfiles ~/dotfiles ~ .bashrc .tmux.conf 
symlink_dotfiles ~/dotfiles ~/.config nvim/init.lua nvim/lua kitty hypr wofi waybar dunst tmux
symlink_dotfiles ~/dotfiles ~/.local/share icons scripts

# Generate an SSH key if not already present
if [ ! -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519 -C "richard@richarddunn.dev" -f ~/.ssh/id_ed25519 -N ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  echo "SSH key generated. Add the following to your GitHub account:"
  cat ~/.ssh/id_ed25519.pub
fi

# Post installation cleanup
sudo pacman -Rns $(pacman -Qdtq) # Remove orphaned packages
sudo pacman -Sc # Clean the package cache

echo "Installation and configuration complete! Please reboot for all changes to take effect."
