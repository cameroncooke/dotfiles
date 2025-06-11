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

# Download all 4 MesloLGS NF fonts as recommended by Powerlevel10k
echo "  Downloading all 4 MesloLGS NF font variants..."

# Regular
echo "  [1/4] Downloading MesloLGS NF Regular..."
curl -L -o "MesloLGS NF Regular.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"

# Bold  
echo "  [2/4] Downloading MesloLGS NF Bold..."
curl -L -o "MesloLGS NF Bold.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"

# Italic
echo "  [3/4] Downloading MesloLGS NF Italic..."
curl -L -o "MesloLGS NF Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"

# Bold Italic
echo "  [4/4] Downloading MesloLGS NF Bold Italic..."
curl -L -o "MesloLGS NF Bold Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"

# Install fonts on macOS
if [[ "$(uname)" == "Darwin" ]]; then
  # Copy to user font directory
  FONT_DIR="$HOME/Library/Fonts"
  mkdir -p "$FONT_DIR"
  cp *.ttf "$FONT_DIR/"
  echo "  ✅ All 4 fonts installed to $FONT_DIR"
  echo ""
  echo "  📝 Font Configuration:"
  echo "     iTerm2: Preferences → Profiles → Text → Font"
  echo "     Select: MesloLGS NF (Regular)"
  echo "     Size: 12pt or 13pt recommended"
  echo ""
  echo "  💡 The imported iTerm profile may already have this configured!"
fi

# Clean up
cd -
rm -rf "$TEMP_DIR"

echo "  Powerlevel10k fonts installed successfully"
exit 0