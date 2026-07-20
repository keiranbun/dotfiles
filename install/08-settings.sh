# Configuration Settings

# Remove all .config that might clash
rm -rf ~/.config/nvim ~/.config/kitty ~/.config/waybar ~/.config/wlogout ~/.config/wofi ~/.config/dunst 2>/dev/null

# Copy all dotfiles files to .config
cp -r "$DOTFILES_ROOT/dotfiles/"* ~/.config

echo -e "\nInstalled: Dotfiles"

# -----------------------------------------------------------------
# Install Thunar fix

CONFIG_DIR="${DOTFILES_ROOT:?}/config/thunar"

# helpers.rc
if [ -f "$CONFIG_DIR/helpers.rc" ]; then
    cp "$CONFIG_DIR/helpers.rc" ~/.config/xfce4/helpers.rc
else
    echo "Warning: $CONFIG_DIR/helpers.rc not found."
fi

echo -e "\nInstalled: Thunar Settings"