#!/bin/bash

# Check if git is installed
if ! command -v git >/dev/null; then
    echo "Git is not installed. Please install git and run the script again."
   
fi

# Create a temporary directory
tmp=$(mktemp -d)
function finish { rm -rf "$tmp"; }  # Clean up after yourself...
trap finish EXIT

# Clone and install hyprland-git
git clone https://aur.archlinux.org/hyprland-git.git "$tmp/hyprland-git" && cd "$tmp/hyprland-git" && makepkg -si --noconfirm --needed
wait

# Clone and install waybar-hyprland-git
git clone https://aur.archlinux.org/waybar-hyprland-git.git "$tmp/waybar-hyprland-git" && cd "$tmp/waybar-hyprland-git" && makepkg -si --noconfirm --needed
wait

# Clone and install plymouth-git
git clone https://aur.archlinux.org/plymouth-git.git "$tmp/plymouth-git" && cd "$tmp/plymouth-git" && makepkg -si --noconfirm --needed
wait

# Clone and install sddm-git
git clone https://aur.archlinux.org/sddm-git.git "$tmp/sddm-git" && cd "$tmp/sddm-git" && makepkg -si --noconfirm --needed
wait

# Remind User to install userdirs.sh after this
echo "Reminder: Install userdirs.sh after this script."
