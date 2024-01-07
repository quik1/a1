#  Use git to download and Install tht following  

if ! command -v >/dev/null; then
    tmp=$(mktemp -d)
    function finish { rm -rf "$tmp"; }  # clean up after yourself...
    trap finish EXIT    

githttps://aur.archlinux.org/hyprland-git.git && cd && makepkg -si --nconfirm --needed

wait

https://aur.archlinux.org/waybar-hyprland-git.git && cd && makepkg -si --nconfirm --needed

wait

https://aur.archlinux.org/plymouth-git.git && cd && makepkg -si --nconfirm --needed

wait

# Remove cloned folders 

sudo -S --noconfirm rm -rf folder
