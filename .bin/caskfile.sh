#!/bin/sh

# Install Native Apps
# Usage: `brew bundle [.bin/]Caskfile`

# Setup
brew install brew caskroom/brew cask/brew-brew cask
brew tap brew caskroom/versions

###############################################################################
# Core
###############################################################################
brew cask install dropbox 2> /dev/null
brew cask install google-chrome 2> /dev/null
brew cask install alfred 2> /dev/null
brew cask install bartender 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install iterm2-nightly 2> /dev/null
brew cask install slate 2> /dev/null
brew cask install dash 2> /dev/null
brew cask install sublime-text3 2> /dev/null
brew cask install atom 2> /dev/null
brew cask install airmail-beta 2> /dev/null
brew cask install evernote 2> /dev/null
brew cask install spotify 2> /dev/null
brew cask install firefox 2> /dev/null
brew cask install vlc 2> /dev/null
brew cask install 1password 2> /dev/null
# brew cask install istat-menus4 2> /dev/null
brew cask install sonos 2> /dev/null
# brew cask install clear 2> /dev/null
brew cask install hipchat 2> /dev/null
brew cask install seil 2> /dev/null
brew cask install karabiner 2> /dev/null
brew cask install hammerspoon 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install disk-inventory-x 2> /dev/null
brew cask install drobo-dashboard 2> /dev/null

###############################################################################
# Nice To Have
###############################################################################
brew cask install ksdiff 2> /dev/null
brew cask install google-drive 2> /dev/null
brew cask install adobe-reader 2> /dev/null
brew cask install flash 2> /dev/null
brew cask install robomongo 2> /dev/null
brew cask install steam 2> /dev/null
brew cask install origin 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install colloquy 2> /dev/null
brew cask install imagealpha 2> /dev/null
brew cask install torbrowser 2> /dev/null
brew cask install liteicon 2> /dev/null
brew cask install boxer 2> /dev/null
brew cask install pandoc 2> /dev/null

###############################################################################
# Utility
###############################################################################
brew cask install java 2> /dev/null
brew cask install silverlight 2> /dev/null
brew cask install xquartz 2> /dev/null

###############################################################################
# Maybe/Suggested/Archive
###############################################################################
# brew cask install imageoptim 2> /dev/null
# brew cask install macvim 2> /dev/null
# brew cask install miro-video-converter 2> /dev/null
# brew cask install the-unarchiver 2> /dev/null
# brew cask install transmission 2> /dev/null
