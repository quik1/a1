#!/bin/bash

# Use git to download and install the following packages

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if git command exists
if ! command_exists "git"; then
    echo "Git is not installed. Please install git first."
    exit 1
fi

# Create a temporary directory
tmp=$(mktemp -d)

# Function to clean up after script execution
function finish {
    rm -rf "$tmp"
}

# Trap EXIT to call the finish function
trap finish EXIT

# Clone and install hyprland-git
git clone https://aur.archlinux.org/hyprland-git.git "$tmp/hyprland-git" &&
cd "$tmp/hyprland-git" &&
makepkg -si --noconfirm --needed

# Clone and install waybar-hyprland-git
git clone https://aur.archlinux.org/waybar-hyprland-git.git "$tmp/waybar-hyprland-git" &&
cd "$tmp/waybar-hyprland-git" &&
makepkg -si --noconfirm --needed

# Clone and install plymouth-git
git clone https://aur.archlinux.org/plymouth-git.git "$tmp/plymouth-git" &&
cd "$tmp/plymouth-git" &&
makepkg -si --noconfirm --needed

# Clone and install sddm-git
git clone https://aur.archlinux.org/sddm-git.git "$tmp/sddm-git" &&
cd "$tmp/sddm-git" &&
makepkg -si --noconfirm --needed

# Remind User to install hyprin.sh after this
echo "Reminder: Install userdirs.sh after this script."

