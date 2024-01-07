`#!/bin/bash

# Define variables
GREEN="$(tput setaf 2)[OK]$(tput sgr0)"
RED="$(tput setaf 1)[ERROR]$(tput sgr0)"
YELLOW="$(tput setaf 3)[NOTE]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
LOG="install.log"
NC="$(tput sgr0)"  # Define the NC variable for text formatting reset

printf "$(tput setaf 2) Welcome to Hyprland installer!\n $(tput sgr0)\n"
sleep 2

printf "$YELLOW Some commands require you to enter your password in order to execute\n\n"
sleep 3

# My pacman config
printf "Doing some pacman tweaks before the actual installation of packages...\n"
sudo sed -i "s/-j2/-j$(nproc)/;/^#MAKEFLAGS/s/^#//" /etc/makepkg.conf
sudo grep -q "ILoveCandy" /etc/pacman.conf || sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
sudo sed -Ei "s/^#(ParallelDownloads).*/\1 = 10/;/^#Color$/s/#//" /etc/pacman.conf

 wait

# Update system before proceeding
printf "${YELLOW} System Update to avoid issues\n"
yay -Syu --noconfirm 2>&1 | tee -a "$LOG"

# Function to print error messages
print_error() {
    printf "%s%s%s\n" "$RED" "$1" "$NC" >&2
}

# Function to print success messages
print_success() {
    printf "%s%s%s\n" "$GREEN" "$1" "$NC"
}

# Function to check if a package is installed
is_package_installed() {
    yay -Qi "$1" &>/dev/null
}

### Install packages ####

yay -S --noconfirm

  packages_to_install=( automake autoconf autoconf-archive pkgconf archinstall arch-install-scripts archiso
    
    wait
    
base base-devel bash-completions efibootmgr sudo linux-firmware libinput coreutils 
libliftoff xcb-util-keysyms plymouth multilib multilib-devel libdisplay-info xcb-util-wm
pixman udisks2 udiskie fakeroot clipgrab stacer-bin openexr 
cava glava grimblast wayland-utils gtk2 gtk3 gtk4 libtiff trayer mpvpaper macchina 
nitch nerd-fonts-inter socat geticons wmctrl spotiflyer-bin
cliphist dunst kitty grim slurp imv pamixer pipewire pipewire-pulse pipewire-audio

        wait

wireplumber polkit-kde-agent qt6-wayland qt5-wayland swaybg  swayidle spicetify-cli gcc   gcc-libs
wofi rofi-lbonn-wayland qt5-base qt6-base qt5ct qt6ct xdg-desktop-portal spicetify-marketplace-bin
xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-desktop-portal-wlr spotify-launcher
dunst swww ncmpcpp mpd ranger sddm kvantum gtk-layer-shell notepadqq geany brightnessctl

      wait

geany-plugins alacritty neofetch btop lz4 p7zip macchina terminator hyprshotgun copyq gvfs
bluez bluez-utils blueman fzf git htop imv lf man-db mesa mesa-utils neofetch neovim  zip unzip 
google-chrome visual-studio-code-bin vlc spotify swaync mpv pacman-contrib playerctl  
hyprshot swayosd-git  rofi-bluetooth-git wlsunset-git rofimoji jq jo kanshi  layer-shell-qt
libdecor npm ario vivid lsd qt6-svg fmt webkitgtk-6.0 thefuck notepadqq yad zenity noise-suppression-for-voice
waypaper-engine aalib ascii jp2a i2pd gjs

  wait 

gum alsa-utils bat lz4 swaylock-effects-git  pipewire-alsa lximage-qt
pipewire-jack pipewire-pulse wireplumber  pulsemixer neovim thunderbird thunar thunar-archive-plugin
thunar-volman tumbler ffmpegthumbnailer gvfs xwaylandvideobridge-bin qt5-graphicaleffects ianny
starship  wl-clipboard  aconfmgr-git spotify marker nano nano-syntax-highlighting mpvpaper hypershade
archlinux-appstream-data  qt5-quickcontrols2 dua-cli aurutils aurman baph fcitx5 
qt5-svg bluefish visual-studio-code-bin desktop-file-utils gtk-engine-murrinebluez-utils
hyprshot nerd-fonts-complete nss nodejs-emojione openssl mintstick util-linux hyprshotgun

  wait

nodejs-nopt picom hyprshot-gui 
dbus python java17-openjfx python-requests gcc gdb nodejs xdg-utils-cxx
python-pipx python-pip python-rich python-pyperclip python-py python-pyaml
python-pyperclip gcc gcc-go dart-sass java-atk-wrapper-common jdk17-openjdk
java-atk-wrapper-openjdk npm nodejs-yaml perl tk pyqt-builder

 wait

python-autocommand python-beautifulsoup4 python-cairo python-chardet python-configobj 
python-distro python-docopt python-fastjsonschema python-gobject python-httplib2 python-idna python-inflect python-jaraco.context python-jaraco.functools python-jaraco.text 
python-keyutils python-lxml python-numpy python-ordered-set python-packaging python-pillow python-platformdirs python-psutil python-pycups python-pycurl python-pydantic python-pyparsing 
python-pyparted python-pywal python-requests python-send2trash python-setproctitle python-setuptools python-six python-soupsieve 
python-tomli python-trove-classifiers python-typing_extensions python-urllib3 python-validate-pyproject python-yaml 
pyalpm python-dateutil python-feedparser python-setuptools python-installer

wait 

python-build python-setuptools python-wheel python-simple-term-menu python-pyparted
	
dracula-gtk-theme dracula-icons-git
rose-pine-gtk-theme
ttf-fira-sans ttf-nerd-fonts-symbols-mono gnu-free-fonts noto-fonts-emoji 
bluez bluez-utils adobe-source-code-pro-fonts 
adobe-source-han-sans-jp-fonts adobe-source-han-serif-kr-fonts 
mupdf  ttf-jetbrains-mono-nerd gigsicle
gifsicle ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols 

wait

ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd otf-ipaexfont noto-fonts-cjk otf-font-awesome
ttf-nered-fonts ttf-nered-fonts-symbold ttf-nered-fonts-symbols-common ttf-jetbrains-mono-nerd noto-fonts-emoji 
ttf-nerd-fonts-symbols-mono vim-devicons ttf-dejavu ttf-droid ttf-fantasque-sans-mono ttf-font-awesome 
ttf-hack ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd adobe-source-code-pro-fonts aces-container
adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-sans-fonts
ttf-ms-fonts tf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono
ttf-opensans ttf-roboto ttf-roboto-mono ttf-ubuntu-font-family tty-clock cantarell-fonts aylurs-gtk-shell
ttf-material-design-icons-git papirus-icon-theme awesome-terminal-fonts hyprdots-ctl ctl

wait

  # Reloading Font
fc-cache -vf

wait

eww-wayland 
    )

    need_installation=false

    for package in "${packages_to_install[@]}"; do
        if is_package_installed "$package"; then
            printf "%s Package %s is already installed. Skipping...\n" "$YELLOW" "$package"
        else
            need_installation=true
            break
        fi
    done

    if $need_installation; then
        printf "${CAT} Installing packages...\n"
        yay -S --noconfirm "${packages_to_install[@]}"
        echo
        print_success "All packages installed successfully."
    else
        printf "${YELLOW} All specified packages are already installed. Skipping installation.\n"
    fi
fi

echo
print_success "All packages installed successfully."

### Copy Config Files ###
read -n1 -rep "${CAT} Would you like to copy config files? (Y)" CFG
if [[ $CFG =~ ^[Yy]$ ]]; then
    printf "Copying config files...\n"
    cp -r .config/kitty ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/wofi ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/swaylock ~/.config/ 2>&1 | tee -a "$LOG"
    cp .config/background ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/dunst ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/waybar ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/hypr ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/rofi ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/zathura ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/qt5ct ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/qt6cc ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/swww ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/swaync ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/alacritty ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/ncmpcpp ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/spotify ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/ranger ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/hyprshot ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/nvim ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/fcitx5 ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/neofetch ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/spiceify ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/cava ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/mako ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/aconfmgr-git ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/hyprshotgun ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/mpv ~/.config/ 2>&1 | tee -a "$LOG"
    cp -r .config/gtklock ~/.config/ 2>&1 | tee -a "$LOG"
         cp -r .config/pywal ~/.config/ 2>&1 | tee -a "$LOG"
         cp -r .config/macchina ~/.config/ 2>&1 | tee -a "$LOG"
         cp -r .config/ags ~/.config/ 2>&1 | tee -a "$LOG"

       

fi
