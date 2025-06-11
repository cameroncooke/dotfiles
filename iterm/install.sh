#!/bin/sh
#
# iTerm2 Profile Installation
#
# This script imports iTerm profiles without overwriting all settings

set -e

echo "  Setting up iTerm2 profiles..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROFILES_DIR="$SCRIPT_DIR"

# Check if iTerm2 is installed
if [ ! -d "/Applications/iTerm.app" ]; then
  echo "  iTerm2 not installed. Install it with: brew install --cask iterm2"
  exit 0
fi

# Import all profiles from Profiles.json (comprehensive profiles file)
if [ -f "$PROFILES_DIR/Profiles.json" ]; then
  echo "  Importing all iTerm2 profiles from Profiles.json..."
  # Use iTerm2's dynamic profiles feature
  DYNAMIC_PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
  mkdir -p "$DYNAMIC_PROFILES_DIR"
  
  # Copy comprehensive profiles file
  cp "$PROFILES_DIR/Profiles.json" "$DYNAMIC_PROFILES_DIR/dotfiles_profiles.json"
  echo "  ✅ All iTerm2 profiles imported successfully"
  echo "  📝 Available in iTerm2 → Preferences → Profiles"
  echo "  💡 Your custom profiles are now available in iTerm2!"
  
# Fallback to single profile if Profiles.json doesn't exist
elif [ -f "$PROFILES_DIR/iterm_profile.json" ]; then
  echo "  Importing single iTerm2 profile..."
  DYNAMIC_PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
  mkdir -p "$DYNAMIC_PROFILES_DIR"
  cp "$PROFILES_DIR/iterm_profile.json" "$DYNAMIC_PROFILES_DIR/dotfiles_profile.json"
  echo "  iTerm2 profile imported successfully"
else
  echo "  No iTerm2 profiles found to import"
  echo "  Expected: Profiles.json or iterm_profile.json"
fi

# Optional: Keep the old plist backup method but don't apply it automatically
if [ -f "$PROFILES_DIR/com.googlecode.iterm2.plist" ]; then
  echo "  Legacy iTerm2 settings found (com.googlecode.iterm2.plist)"
  echo "  These settings are preserved but not automatically applied"
  echo "  To manually restore all settings: cp $PROFILES_DIR/com.googlecode.iterm2.plist ~/Library/Preferences/"
fi

exit 0