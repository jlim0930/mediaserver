#!/bin/sh

# fixes perms and ownership of files on the NAS.  Please adjust for your environment

chown -R nas:users /data/media
chmod -R 755 /data/media
logger "[DEBUG PLEX] fixperms finished"

