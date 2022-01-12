#!/bin/bash

REMOTE=192.168.1.201
USER=cj
CONFIG_DIR=/etc/leo-config

scp -r * $USER@$REMOTE:$CONFIG_DIR
