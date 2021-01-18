#!/bin/sh

# Ask for the administrator password upfront
sudo -v

#https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
#install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/cask-versions

#install packages
brew install git
brew install python3
brew install node
brew install php
brew install php@7.4
brew install composer
brew install wget
brew install curl
brew install act # github actions emulator
brew install --cask docker
brew install --cask iterm2
brew install --cask alfred
brew install --cask gpg-suite
brew install --cask jetbrains-toolbox
brew install --cask slack
brew install --cask discord
brew install --cask zoomus
brew install --cask firefox-developer-edition
brew install --cask gitkraken
brew install --cask google-chrome
brew install --cask commander-one
brew install --cask qbittorrent
brew install --cask vlc

# install global packages
npm install -g tldr

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


#configure git
git config --global user.name 'Nandor Kraszlan'
git config --global user.email "nandor.kraszlan@gmail.com"

# clone config files and link them

# Alfred configure
# JetBrains install phpstorm
# enable to open files from terminal

brew doctor
brew update
brew upgrade
brew cleanup

source setup-helpers

install_dotfile "shell/.aliases"
install_dotfile "shell/.functions"
install_dotfile "shell/.zsconf"
install_dotfile "shell/.zshrc"
install_dotfile ".wgetrc"
