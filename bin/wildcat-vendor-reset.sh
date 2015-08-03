#!/bin/bash

# clear any/all vendors
rm -rf vendor # old branches ignore this, cli branches store stuff here
rm -rf node_modules
rm -rf bower_components # cli branches install bower stuff here
rm -rf plugman

rm -rf dist
rm -rf phonegap
rm -rf tmp

rm -rf cache # Usually not desired to clear this, but it is a candidate

# git reset --hard

npm install
