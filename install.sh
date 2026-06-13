export DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Exit immediately if a command exits with a non-zero status
set -e

# Install everything in /install
for script in ./install/*.sh; do
  echo "Running $script..."
  bash "$script"
done