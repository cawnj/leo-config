#!/bin/bash

for dir in ./*; do 
    if [[ -d "$dir" && ${dir} != *"disabled"* ]]; then
        cd "$dir"
        docker-compose pull
        docker-compose up -d
        cd ..
    fi
done

docker image prune -f
