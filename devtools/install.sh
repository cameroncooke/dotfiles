#!/bin/sh
#
# Developer Tools
#
# This installs additional development tools not covered by Homebrew

set -e

echo "  Setting up additional developer tools..."

# Ensure we have Homebrew path
if [[ "$(uname -m)" == "arm64" ]] && [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Install global npm packages if npm is available
if command -v npm &> /dev/null; then
  echo "  Installing global npm packages..."
  
  # Create npm global directory if it doesn't exist
  mkdir -p ~/.npm-global
  npm config set prefix '~/.npm-global'
  
  # Install common global packages
  npm install -g @anthropic-ai/claude-code || echo "  Warning: Claude Code installation failed"
  npm install -g typescript || echo "  Warning: TypeScript installation failed"
  npm install -g @angular/cli || echo "  Warning: Angular CLI installation failed"
  npm install -g create-react-app || echo "  Warning: Create React App installation failed"
  npm install -g yarn || echo "  Warning: Yarn installation failed"
  npm install -g http-server || echo "  Warning: http-server installation failed"
  npm install -g live-server || echo "  Warning: live-server installation failed"
  npm install -g nodemon || echo "  Warning: nodemon installation failed"
  npm install -g prettier || echo "  Warning: Prettier installation failed"
  npm install -g eslint || echo "  Warning: ESLint installation failed"
else\n  echo "  npm not available, skipping global npm packages"\nfi\n\n# Install Ruby gems if rbenv/ruby is available\nif command -v gem &> /dev/null; then\n  echo \"  Installing Ruby gems...\"\n  gem install bundler || echo \"  Warning: Bundler installation failed\"\n  gem install cocoapods || echo \"  Warning: CocoaPods installation failed\"\n  gem install fastlane || echo \"  Warning: Fastlane installation failed\"\nelse\n  echo \"  Ruby/gem not available, skipping Ruby gems\"\nfi\n\n# Set up development directories\necho \"  Setting up development directories...\"\nmkdir -p ~/Developer\nmkdir -p ~/Developer/Projects\nmkdir -p ~/Developer/Scripts\nmkdir -p ~/Developer/Playground\n\n# Fix common macOS development issues\necho \"  Applying macOS development fixes...\"\n\n# Increase file watch limits\necho \"kern.maxfiles=65536\" | sudo tee -a /etc/sysctl.conf > /dev/null || true\necho \"kern.maxfilesperproc=65536\" | sudo tee -a /etc/sysctl.conf > /dev/null || true\n\necho \"  Developer tools setup completed\"\nexit 0