#!/bin/bash

# Start mongo in background
mongod &

# ssh tunnel to qa.zipscene.com
$(ssh -o "ServerAliveInterval 10" -o "TCPKeepAlive yes" -o "BatchMode yes" -L 27018:127.0.0.1:27017 rhilgefort@qa.zipscene.com &> /dev/null) &

# node-inspector &
