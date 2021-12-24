#!/bin/bash

REMOTE=192.168.1.201
USER=pi
CONFIG_DIR=/home/pi/leo-configs

scp -r `pwd`/* $USER@$REMOTE:$CONFIG_DIR

