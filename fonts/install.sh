#!/bin/sh
#
# Fonts
#
# This installs fonts needed for Powerlevel10k

set -e

echo "  Installing Powerlevel10k fonts..."

# Create a temporary directory for fonts
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download MesloLGS NF fonts (recommended for Powerlevel10k)
echo "  Downloading MesloLGS NF fonts..."
curl -L -o "MesloLGS NF Regular.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
curl -L -o "MesloLGS NF Bold.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
curl -L -o "MesloLGS NF Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
curl -L -o "MesloLGS NF Bold Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"

# Install fonts on macOS
if [[ "$(uname)" == "Darwin" ]]; then
  # Copy to user font directory
  FONT_DIR="$HOME/Library/Fonts"
  mkdir -p "$FONT_DIR"
  cp *.ttf "$FONT_DIR/"
  echo "  Fonts installed to $FONT_DIR"
  echo "  NOTE: You'll need to configure iTerm2 to use 'MesloLGS NF' font"
  echo "        Go to iTerm2 → Preferences → Profiles → Text → Font"
fi

# Clean up
cd -
rm -rf "$TEMP_DIR"

echo "  Powerlevel10k fonts installed successfully"
exit 0