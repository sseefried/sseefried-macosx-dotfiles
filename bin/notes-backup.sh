#!/bin/bash

REMOUNT=0
if [ -d /Volumes/Notes ]; then 
  REMOUNT=1
  diskutil eject /Volumes/Notes
  sleep 3
fi

DIR="$HOME/Dropbox/Documents"
FILE="$DIR/Notes.sparseimage"

DATE="$(date +%Y-%m-%d)"
BACKUP="$(basename $FILE .sparseimage)-$DATE.sparseimage"

cp -v "$FILE" "$DIR/$BACKUP"

if [ "$REMOUNT" -eq 1 ]; then 
    open "$FILE"
fi
