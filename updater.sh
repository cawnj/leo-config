#!/bin/bash

# pull any new images and
# recreate the containers if a new image is pulled

now=`date +"%Y-%m-%d %T"`
printf "%s\n---\n" "$now"
for dir in ./*; do 
    if [[ -d "$dir" && ${dir} != *"disabled"* ]]; then
        cd "$dir"
        docker compose pull -q
        docker compose up -d
        cd ..
    fi
done
docker image prune -f
echo
