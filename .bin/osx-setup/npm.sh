#!/bin/sh

# Install latest node and then install globals on system node
nvm install node
nvm use system

npm install -g shelljs

npm install -g eslint

npm install -g bower
npm install -g gulp-cli
npm install -g webpack

npm install -g mocha

npm install -g git-labelmaker

# https://github.com/semantic-release/semantic-release
npm install -g semantic-release-cli
