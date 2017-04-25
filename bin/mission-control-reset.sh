#!/bin/bash

###############################################################################
# Fixes "Mission Control" hotkeys not working (or mission control not
# working at all).
#
# https://discussions.apple.com/message/31232936#message31232936
###############################################################################

defaults write com.apple.dock mcx-expose-disabled -bool false
defaults write com.apple.dashboard mcx-disabled -boolean NO
killall Dock
