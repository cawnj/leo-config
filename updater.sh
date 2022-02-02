#!/bin/bash

for dir in ./*; do 
    if [[ -d "$dir" && ${dir} != *"disabled"* ]]; then
        cd "$dir"
        docker-compose down
        docker-compose rm -f
        docker-compose pull
        docker-compose up -d
        cd ..
    fi
done
