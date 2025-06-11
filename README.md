# 🚀 Modern macOS Development Environment

> **One command to rule them all** - Complete terminal and development setup for macOS

Transform your Mac into a powerful development machine with a single command. This dotfiles repository sets up everything you need for modern software development.

## ✨ What You Get

### 🎨 Beautiful Terminal
- **Zsh** with Oh My Zsh framework
- **Powerlevel10k** theme with instant prompt
- **Nerd Fonts** with icons and powerline symbols
- **Syntax highlighting** and **auto-suggestions**

### 🛠️ Development Tools
- **Node.js** with NVM version management
- **Python 3.12** for data science and automation
- **Ruby** with rbenv for gem management
- **Swift** tools for iOS/macOS development
- **Git** with advanced aliases and workflows

### ⚡ Productivity CLI Tools
- **bat** - Better `cat` with syntax highlighting
- **eza** - Modern `ls` replacement with colors
- **fd** - Fast alternative to `find`
- **ripgrep** - Lightning fast search
- **fzf** - Fuzzy finder for everything
- **jq/yq** - JSON/YAML processors
- **htop** - System monitoring
- **tmux** - Terminal multiplexer

### 🎯 Applications
- **Amazon Q** - AI assistant for development
- **Tuist** - Swift project generator and manager
- **GitHub CLI** - Git workflow automation (CLI tool)
- **Docker CLI** - Containerization (command-line only)

### 📦 Optional Applications
These can be enabled by uncommenting in the Brewfile:
- **iTerm2** - Advanced terminal emulator
- **Visual Studio Code** - Code editor
- **Docker Desktop** - Docker with GUI

## 🏃‍♂️ Quick Start

### One-Line Installation
```bash
git clone https://github.com/cameroncooke/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && script/bootstrap
```

### Manual Installation
```bash
# Clone the repository
git clone https://github.com/cameroncooke/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run the installation
script/bootstrap
```

### What Happens During Installation
1. ✅ **Prerequisites check** - Verifies Xcode Command Line Tools
2. ✅ **Git configuration** - Sets up your Git identity
3. ✅ **Homebrew** - Installs package manager (if needed)
4. ✅ **Oh My Zsh** - Installs framework and plugins
5. ✅ **Fonts** - Downloads and installs Nerd Fonts
6. ✅ **Symlinks** - Links configuration files to your home directory
7. ✅ **Dependencies** - Installs all packages via Homebrew
8. ✅ **Components** - Runs additional installers (NVM, development tools)
9. ✅ **Validation** - Checks everything installed correctly

## 🔄 Keeping Up to Date

```bash
# Update everything (run periodically)
script/update

# Or use one of these aliases (after sourcing ~/.zshrc)
dot                  # Short alias
dotfiles-update      # Full command name
df-update           # Alternative alias
```

This updates:
- Dotfiles repository
- Homebrew and all packages
- Oh My Zsh and themes
- Global npm packages
- Ruby gems

## 🎛️ Configuration

### First Time Setup
1. **Restart your terminal** or run `source ~/.zshrc`
2. **Configure iTerm2 font**: Preferences → Profiles → Text → Font → \"MesloLGS Nerd Font\"
3. **Customize prompt**: Run `p10k configure`
4. **Add local settings**: Edit `~/.localrc` for machine-specific configuration

### Local Environment Variables
Create `~/.localrc` for private/local settings:
```bash
# API keys and secrets
export GITHUB_TOKEN="your-token-here"
export AWS_PROFILE="your-profile"

# Local paths
export PATH="/your/custom/path:$PATH"

# Custom aliases
alias myproject="cd ~/Developer/my-project"
```

### Adding New Tools
1. **Homebrew packages**: Add to `Brewfile`
2. **Custom scripts**: Place in `bin/` directory
3. **Shell configuration**: Create `component/*.zsh` files
4. **Install scripts**: Add `component/install.sh` for setup logic

## 🗂️ Project Structure

```
~/.dotfiles/
├── script/
│   ├── bootstrap         # Main installation script
│   ├── update           # Update all components
│   └── uninstall        # Remove dotfiles (for testing)
├── Brewfile             # Homebrew packages and apps
├── bin/                 # Custom scripts (added to PATH)
├── zsh/                 # Zsh configuration and plugins
├── git/                 # Git configuration and aliases
├── fonts/               # Font installation
├── nvm/                 # Node.js version management
├── devtools/            # Development tools setup
└── */                   # Component directories
    ├── *.symlink        # Files linked to ~/.*
    ├── *.zsh            # Shell configuration
    └── install.sh       # Component installer
```

## 🎯 Key Features

### 🔄 Idempotent Installation
- **Safe to run multiple times** - Won't break existing setup
- **Incremental updates** - Only installs missing components
- **Conflict resolution** - Handles existing files gracefully

### 🧩 Modular Architecture
- **Easy to extend** - Add new components without touching core
- **Topic-based organization** - Related files grouped together
- **Automatic loading** - Zsh files loaded automatically

### 🛡️ Robust Error Handling
- **Graceful failures** - Continues if individual components fail
- **Clear feedback** - Shows what's working and what isn't
- **Validation** - Checks installation at the end

## 🔧 Available Commands

| Command | Description |
|---------|-------------|
| `script/bootstrap` | Full installation from scratch |
| `script/update` | Update all components |
| `script/uninstall` | Remove dotfiles (keeps software) |
| `dot` | Quick update (alias) - use after sourcing ~/.zshrc |
| `dotfiles-update` | Main update command (avoids graphviz conflict) |
| `df-update` | Alternative update alias |
| `p10k configure` | Customize Powerlevel10k theme |
| `brew bundle` | Install/update Homebrew packages |

## 📚 Included Git Aliases

```bash
git st          # status
git co          # checkout
git br          # branch
git ci          # commit
git df          # diff
git lg          # beautiful log graph
git up          # pull and rebase
git promote     # push and set upstream
git wtf         # what the fudge (detailed status)
```

## 🐛 Troubleshooting

### Common Issues

**Installation hangs or fails:**
- Cancel with Ctrl+C and re-run `script/bootstrap`
- Check internet connection for downloads
- Ensure you have admin privileges

**Terminal looks broken:**
- Install and configure the Nerd Font in your terminal
- Run `p10k configure` to fix Powerlevel10k
- Restart terminal application

**Command not found errors:**
- Run `source ~/.zshrc` to reload configuration
- Check if tools are in PATH: `echo $PATH`
- Re-run `script/bootstrap` to fix missing installs

**Permission errors:**
- Some Homebrew operations may require password
- Ensure you're an admin user on the system

### Getting Help

```bash
# Check what's installed
brew list
npm list -g --depth=0
which node python3 ruby

# Validate installation
script/bootstrap  # Safe to re-run

# Start fresh
script/uninstall && script/bootstrap
```

## 🏗️ System Requirements

- **macOS** 10.15+ (Catalina or later)
- **Xcode Command Line Tools** (`xcode-select --install`)
- **Admin privileges** (for Homebrew installation)
- **Internet connection** (for package downloads)

## 🤝 Contributing

This is a personal dotfiles setup, but feel free to:
- Fork for your own use
- Open issues for bugs
- Submit PRs for improvements
- Share your own customizations

## 📄 License

MIT License - Use it however you want!

---

**💡 Pro Tip**: After installation, explore the `bin/` directory for useful scripts and check out the Git aliases in `git/aliases.zsh` for productivity boosts!