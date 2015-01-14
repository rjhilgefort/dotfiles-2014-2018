#!/bin/bash

find . -type f -name "* conflicted copy*" -exec rm -f {} \;
awk '!/conflicted/' .git/packed-refs > temp && mv temp .git/packed-refs
git reset --hard
git clean -f
