#!/bin/sh

# cleans up /data/tmp for various media files that gets placed in there by sonarr/radarr

OIFS="$IFS"
IFS=$'\n'

for i in `find /data/tmp -type f \( -name "*.mkv" -o -name "*.MKV" -o -name "*.avi" -o -name "*.AVI" -o -name "*.mp4" -o -name "*.MP4" -o -name "*.JPG" -o -name "*.jpg" -o -name "*.nfo" -o -name "*.srt" -o -name "*.nfo-orig" \)`
do
  logger "[DEBUG CLEAN TMP] found and deleting ${i}"
  rm -rf "${i}"
done

IFS="$OIFS"

