#!/bin/bash

###############################################################################
# REF: http://martinbrochhaus.com/pair.html
#
# Script Interface:
#     $1 username
#     $2 password
###############################################################################

# Check params
if (( $# != 2 ))
then
    echo "'username' and 'password' args are required."
    exit 1
fi

# find out your staff group id (for me it is 20)
# dscacheutil -q group | ag staff
STAFF_GROUP_ID=20
USERNAME="$1"
PASSWORD="$2"

MAXID=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1)
NEWID=$((MAXID+1))

sudo dscl . -create /Users/$USERNAME
sudo dscl . -create /Users/$USERNAME UserShell /bin/bash
sudo dscl . -create /Users/$USERNAME UniqueID "$NEWID"
sudo dscl . -create /Users/$USERNAME PrimaryGroupID $STAFF_GROUP_ID
sudo dscl . -create /Users/$USERNAME RealName "Pair Programmer"
sudo dscl . -create /Users/$USERNAME NFSHomeDirectory /Users/$USERNAME
sudo dscl . -passwd /Users/$USERNAME $PASSWORD
sudo dscl . -append /Groups/com.apple.access_ssh GroupMembership $USERNAME
sudo createhomedir -c -u $USERNAME
# make sure that there is /Users/pairprogger/ on your disk now
