#!/bin/bash

###############################################################################
# Script Interface:
#     $1 brand id desired
#     $2 data environment
###############################################################################

cd /Users/rjhilgefort/Projects/zipscene/wildcat
# cd /home/zipscene/vhosts/$1.wildcat.qa.zipscene.com

git fetch -p
git pull

# Cleanhouse
rm -rf node_modules
rm -rf bower_components
rm -rf cache
rm -rf tmp
rm -rf dist
# rm -rf plugman
# rm -rf phonegap

npm install

grunt build -B $1 -D $2 -E dev -P browser
