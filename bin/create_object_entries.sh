#!/usr/bin/bash

project_directory=$(pwd)

catalog_directory='content/catalogue'

for object in {1..52}; do
    file="$project_directory/$catalog_directory/${object}.md"
    echo "---" > $file
    echo "layout: entry" >> $file
    echo "order: 100.${object}" >> $file
    echo "object:" >> $file
    echo "    - id: \"${object}\"" >> $file
    echo "---" >> $file
done

