#!/bin/bash

# restart the plex container, as the
# container checks for server updates on restart
# supress output by redirecting stdout to /dev/null

docker restart plex > /dev/null
