#!/bin/bash

# Path to the NetworkManager configuration directory
nm_conf_dir="/etc/NetworkManager/conf.d"

# Path to the configuration file
conf_file="$nm_conf_dir/wifi-powersave-off.conf"

# Check if the directory exists, if not, create it
if [ ! -d "$nm_conf_dir" ]; then
    sudo mkdir -p "$nm_conf_dir"
fi

# Create or overwrite the configuration file
sudo tee "$conf_file" > /dev/null <<EOL
# File to be placed under $nm_conf_dir
[connection]
# Values are 0 (use default), 1 (ignore/don't touch), 2 (disable) or 3 (enable).
wifi.powersave = 2
EOL

# Restart NetworkManager
sudo systemctl restart NetworkManager

echo "Wi-Fi powersave configuration applied. NetworkManager restarted."
