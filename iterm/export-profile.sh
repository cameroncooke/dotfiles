#!/bin/sh
#
# Export iTerm2 Profile
#
# This script exports your current iTerm profile for safekeeping

set -e

echo "Exporting current iTerm2 profile..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create backup of existing profiles
if [ -f "$SCRIPT_DIR/Profiles.json" ]; then
  BACKUP_FILE="$SCRIPT_DIR/Profiles.backup.$(date +%Y%m%d_%H%M%S).json"
  cp "$SCRIPT_DIR/Profiles.json" "$BACKUP_FILE"
  echo "  Backed up existing Profiles.json to: $BACKUP_FILE"
elif [ -f "$SCRIPT_DIR/iterm_profile.json" ]; then
  BACKUP_FILE="$SCRIPT_DIR/iterm_profile.backup.$(date +%Y%m%d_%H%M%S).json"
  cp "$SCRIPT_DIR/iterm_profile.json" "$BACKUP_FILE"
  echo "  Backed up existing profile to: $BACKUP_FILE"
fi

# Note: iTerm2 doesn't have a command-line export for individual profiles
# Users need to export manually from iTerm2
echo ""
echo "To export ALL your iTerm2 profiles (RECOMMENDED):"
echo "  1. Open iTerm2"
echo "  2. Go to Preferences → Profiles"
echo "  3. Click 'Other Actions...' (bottom of profiles list)"
echo "  4. Choose 'Copy All Profiles as JSON'"
echo "  5. Save as: $SCRIPT_DIR/Profiles.json"
echo ""
echo "To export a single profile:"
echo "  1. Select your profile in Preferences → Profiles"
echo "  2. Click 'Other Actions...' → 'Copy Profile as JSON'"
echo "  3. Save as: $SCRIPT_DIR/iterm_profile.json"
echo ""
echo "To export complete settings:"
echo "  1. Go to Preferences → General → Preferences"
echo "  2. Click 'Save Current Settings to Folder...'"
echo "  3. Save to: $SCRIPT_DIR/"

exit 0