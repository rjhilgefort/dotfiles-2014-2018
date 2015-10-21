#!/bin/sh

# Install command-line tools using Homebrew
# Usage: `brew bundle [.bin/]Brewfile`

# Make sure we’re using the latest Homebrew, Upgrade any already-installed formulae
brew update
brew upgrade --all

# MOAR PACKAGES!
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap railwaycat/emacsmacport

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# GNU Command Line Tools
# Note: --default-name ignores the 'g' prefix (which fixes conflict)
brew install moreutils
brew install binutils
brew install diffutils
brew install ed --with-default-names
brew install findutils --with-default-names
brew install gawk
brew install guile --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls --with-default-names
brew install grep --with-default-names
brew install gzip
brew install watch
brew install wdiff --with-gettext
brew install wget --enable-iri

# Updated OSX tools
brew install bash # Don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`
brew install bash-completion
brew install emacs
brew install gpatch
brew install m4
brew install make
brew install nano
brew install emacs-mac --with-spacemacs-icon

# Install more recent versions of some OS X tools
brew install file-formula
brew install git
brew install less
brew install openssh --with-brewed-openssl
brew install perl518 # must run "brew tap homebrew/versions" first!
brew install python --with-brewed-openssl
brew install rsync
brew install svn
brew install unzip
brew install vim --with-python --with-ruby --with-perl --override-system-vi
brew install macvim --custom-system-icons --override-system-vim

# General Utilities
brew install node
brew install zsh
brew install mongodb
brew install mongoose
brew install redis
brew install tmux
brew install reattach-to-user-namespace
brew install tig
brew install ack
brew install ag
brew install fasd
brew install git-extras
brew install zlib
brew install gdb --with-brewed-python
brew install --HEAD https://raw.github.com/neovim/neovim/master/neovim.rb
brew install mutt
brew install irssi
brew install task
brew install tern
brew install editorconfig
brew install pandoc
brew install zsh-completions
brew install ranger
brew install w3m
brew install markdown
brew install wemux

brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Android
brew install android-sdk
brew install ant

# Lua
brew install luarocks

# Other useful binaries
# brew install gcc
# brew install bfg
# brew install exiv2
# brew install foremost
# brew install hashpump
brew install imagemagick --with-webp
# brew install lynx
# brew install nmap
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rhino
# brew install sqlmap
# brew install tree
# brew install ucspi-tcp # `tcpserver` et al.
# brew install webkit2png
# brew install xpdf
# brew install zopfli

# brew install homebrew/versions/lua52

# Remove outdated versions from the cellar
brew cleanup
