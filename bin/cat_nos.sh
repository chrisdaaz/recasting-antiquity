#!/bin/bash

# find and replace
# sed 's/title\: \"/title\: \"1\. /' 1.md

dir='/home/chris/recasting-antiquity/content/catalogue'

for file in $dir/*.md
do
    number=$(basename "$file" | cut -d. -f1)
    echo "Working on catalog entry: $number"
    sed -i "s/title\: /title\: "${number}"\. /" $file
done