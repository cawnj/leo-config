#!/bin/bash

file=/backups/hedgedoc/hedgedoc-$(date +%Y-%m-%d_%H-%M-%S).sql

docker exec hedgedoc-db pg_dump hedgedoc -U hedgedoc > "${file}"

find /backups/hedgedoc/hedgedoc* -ctime +14 -exec rm {} \;

file_size=$(find $file -exec du -sh {} \; | cut -f1 | xargs | sed 's/$//')

if test -f "$file"; then
  curl -H "Content-Type: application/json" -d '{"content": "`HedgeDoc` backup has just **SUCCEEDED**\nFile name: `'"$file"'`\nDate: `'"$(TZ=Europe/Dublin date)"'`"}' $DISCORD_WEBHOOK
else
  curl -H "Content-Type: application/json" -d '{"content": "`HedgeDoc` backup has just **FAILED**\nFile name: `'"$file"'`\nDate: `'"$(TZ=Europe/Dublin date)"'`"}' $DISCORD_WEBHOOK
fi
