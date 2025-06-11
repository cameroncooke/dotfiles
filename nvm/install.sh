#!/bin/sh
#
# NVM (Node Version Manager)
#
# This installs NVM if it's not already installed

set -e

echo "  Installing/updating NVM..."

# Check if NVM is already installed
if [ -d "$HOME/.nvm" ]; then
  echo "  NVM already installed at $HOME/.nvm"
  # Update NVM to latest version
  cd "$HOME/.nvm"
  git fetch --tags origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)` || {
    echo "  Warning: Could not update NVM, continuing with existing version"
  }
  cd -
else
  echo "  Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash || {
    echo "  Failed to install NVM"
    exit 1
  }
fi

# Source NVM for this session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install latest LTS Node.js if not already installed
if command -v nvm &> /dev/null; then
  echo "  Installing latest LTS Node.js..."
  nvm install --lts || echo "  Warning: Could not install latest LTS Node.js"
  nvm use --lts || echo "  Warning: Could not use latest LTS Node.js"
fi

echo "  NVM installation completed"
exit 0