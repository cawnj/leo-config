#!/bin/bash

REMOTE=192.168.0.201
USER=cj
CONFIG_DIR=/etc/leo-config

find . -name ".env" -type f | xargs -I {} scp -r {} $USER@$REMOTE:$CONFIG_DIR/{}
