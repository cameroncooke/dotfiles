#!/bin/sh
#
# Amazon Q
#
# This checks if Amazon Q is installed and provides guidance

set -e

echo "  Checking Amazon Q installation..."

# Check if Amazon Q Desktop app is installed
if [ -d "/Applications/Amazon Q.app" ]; then
  echo "  Amazon Q Desktop is already installed"
else
  echo "  Amazon Q Desktop not found in /Applications/"
  echo "  Please install Amazon Q Desktop from: https://aws.amazon.com/q/"
  echo "  Or use: brew install --cask amazon-q"
fi

# Check if Amazon Q shell integration is available
if [ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]; then
  echo "  Amazon Q shell integration is configured"
else
  echo "  Amazon Q shell integration not found"
  echo "  After installing Amazon Q Desktop, open it and enable shell integration"
fi

exit 0