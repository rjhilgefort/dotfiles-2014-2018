#!/bin/bash

# clear any/all vendors
rm -rf vendor # old branches ignore this, cli branches store stuff here
rm -rf node_modules
rm -rf bower_components # cli branches install bower stuff here
rm -rf plugman

git reset --hard

npm install
