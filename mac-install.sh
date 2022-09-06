#!/bin/sh

# Ask for the administrator password upfront
sudo -v
# todo exit if pwd doesn't ends with /config-files
xcode-select --install # todo - check if it exists

#https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
#install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-versions

#install packages
brew install git
brew install python3
brew install node
brew install php
brew install curl
brew install wget
brew install composer
brew install act # github actions emulator
brew install zsh
brew install --cask docker
brew install --cask iterm2
brew install --cask raycast
brew install --cask gpg-suite
brew install --cask jetbrains-toolbox
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask discord
brew install --cask zoom
brew install --cask signal
brew install --cask firefox-developer-edition
brew install --cask gitkraken
brew install --cask gitify
brew install --cask google-chrome
brew install --cask commander-one
brew install --cask qbittorrent
brew install --cask vlc
brew install --cask spotify
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install global packages
npm install -g tldr
npm install -g yarn

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

#https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# configure Mac
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowToolBar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# set key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
# set key repeat delay
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Alfred configure
# disable spotlight hotkey
#defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys
# JetBrains install phpstorm

brew doctor
brew update
brew upgrade
brew cleanup

cp ./shell/.aliases /.aliases
cp ./shell/.functions /.functions
echo "source ~/.aliases" >> /.zshrc
echo "source ~/.functions" >> /.zshrc
echo "run composer self-update --update-keys to set public keys for package verification"
