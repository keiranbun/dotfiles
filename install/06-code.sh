# Code Settings/Extensions

# Install Extensions
code --install-extension vscodevim.vim
code --install-extension arturock.gitstash
code --install-extension dbaeumer.vscode-eslint
code --install-extension bradlc.vscode-tailwindcss
code --install-extension pkief.material-icon-theme
code --install-extension github.github-vscode-theme
code --install-extension wayou.vscode-todo-highlight
code --install-extension esbenp.prettier-vscode
code --install-extension streetsidesoftware.code-spell-checker

# Copy settings/keybindings
cp config/code/keybindings.json ~/.config/Code - OSS/User
cp config/code/settings.json ~/.config/Code - OSS/User

echo -e "\nInstalled: Code Settings & Extensions"