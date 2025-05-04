#!/bin/bash
<<info
This script simulate automated backup with rotation.
info

src=$1
destination=$2
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

zip -r "$destination/backup-$timestamp.zip" $src > /dev/null

count=$(ls -1 "$destination/" | wc -l)

if [ "$count" -gt 3 ]; then
	oldest_file=$(ls -1t "$destination" | tail -n 1)
	rm "$destination/$oldest_file"
fi

echo "Successfully completed backup."
