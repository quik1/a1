#!/bin/bash

# Clone Rofi repository into .config/rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git ~/.config/rofi &&

# Navigate to the Rofi directory
cd ~/.config/rofi &&

# Make the setup script executable
chmod +x setup.sh &&

# Run the setup script
./setup.sh
