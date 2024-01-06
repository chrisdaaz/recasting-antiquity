#!/usr/bin/bash

project_directory=$(pwd)
list=${project_directory}"/content/_data/figures.yml"

echo "figure_list:" > $list
echo "" >> $list

for figure in {1..53}; do
    echo "  - id: cat-${figure}" >> $list
    echo "    src: figures/${figure}.jpg" >> $list
    echo "    caption: ''" >> $list
    echo "    credit: ''" >> $list
    echo "" >> $list
done

