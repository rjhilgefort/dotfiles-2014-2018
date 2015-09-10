#!/bin/sh

# Make sure we're up to date
sudo apt-get update

# Ruby, RubyGems
sudo apt-get install ruby-full build-essential
# Gems
gem install jekyll

# pandoc
sudo apt-get install pandoc

# ranger
sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo
