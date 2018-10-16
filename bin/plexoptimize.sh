#!/bin/sh

# script to automatically optimize plex db

# check to see if I'm root
if ! [ $(id -u) = 0 ]; then
   echo "Please run as root user"
   exit 1
fi

# get token
TOKEN=`cat "/data/plex/Library/Application Support/Plex Media Server/Preferences.xml" | sed -e 's;^.* PlexOnlineToken=";;' | sed -e 's;".*$;;' | tail -1`

# print token for troubleshooting
logger "[DEBUG PLEX] TOKEN: $TOKEN"

# perform optmize
curl --request PUT http://127.0.0.1:32400/library/optimize\?async=1\&X-Plex-Token=$TOKEN

# make it sleep for 5 sec
sleep 240

logger "[DEBUG PLEX] auto-optimization finished running"

