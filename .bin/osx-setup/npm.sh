#!/bin/sh

# Install latest node and then install globals on system node
nvm install node
nvm use system

npm install -g eslint
npm install -g bower
