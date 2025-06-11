#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

set -e

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  echo "  This may ask for your password..."
  
  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    echo "  Failed to install Homebrew"
    exit 1
  }
  
  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ "$(uname -m)" == "arm64" ]]; then
    echo "  Detected Apple Silicon Mac, adding Homebrew to PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "  Homebrew already installed"
fi

# Ensure brew is in PATH for the rest of the script
if [[ "$(uname -m)" == "arm64" ]] && [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

exit 0
