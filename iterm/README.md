# iTerm2 Configuration

This directory contains iTerm2 profiles and settings for the dotfiles setup.

## Files

- **`Profiles.json`** - ALL your iTerm2 profiles (recommended - imports all profiles at once)
- **`iterm_profile.json`** - Single iTerm2 profile (fallback if Profiles.json not available)
- **`com.googlecode.iterm2.plist`** - Legacy full iTerm2 settings (preserved but not auto-applied)
- **`install.sh`** - Imports profiles without overwriting your existing settings
- **`export-profile.sh`** - Helper script with instructions to export your profiles

## How It Works

The new approach uses iTerm2's **Dynamic Profiles** feature:
- Your profiles are copied to `~/Library/Application Support/iTerm2/DynamicProfiles/`
- iTerm2 automatically detects and loads all profiles
- Your existing settings remain untouched
- You can switch between any imported profiles in iTerm2's preferences
- Multiple profiles are supported via `Profiles.json`

## Usage

### During Bootstrap
The profile is automatically imported when you run `script/bootstrap`.

### Manual Import
```bash
~/.dotfiles/iterm/install.sh
```

### Select the Profile
1. Open iTerm2 → Preferences → Profiles
2. Select the imported profile from the list
3. Optionally set it as default

### Export Your Profiles

**To save ALL profiles (RECOMMENDED):**
1. iTerm2 → Preferences → Profiles
2. Click "Other Actions..." → "Copy All Profiles as JSON"
3. Save as `~/.dotfiles/iterm/Profiles.json`

**To save a single profile:**
1. Select your profile in Preferences → Profiles
2. Click "Other Actions..." → "Copy Profile as JSON"
3. Save as `~/.dotfiles/iterm/iterm_profile.json`

## Fonts

The bootstrap process installs all 4 MesloLGS NF fonts required for Powerlevel10k:
- MesloLGS NF Regular
- MesloLGS NF Bold
- MesloLGS NF Italic
- MesloLGS NF Bold Italic

Your imported profile should already be configured to use these fonts.