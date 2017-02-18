#
# Install iTerm Preferences
#

path=$(dirname "$0")"/"

defaults delete com.googlecode.iterm2 
cp "$path"com.googlecode.iterm2.plist ~/Library/Preferences
defaults read com.googlecode.iterm2