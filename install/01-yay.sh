# Install Yay
sudo pacman -S --noconfirm go
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

echo -e "\nInstalled: Yay"