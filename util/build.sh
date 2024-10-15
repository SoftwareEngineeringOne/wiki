#!/usr/bin/env bash

shopt -s globstar

cp -r /var/doc/* .

INTERMEDIATE_MD_FILENAME="all.md"
BASE_DIR=$(pwd)

# Add new line to every file if missing
for file in **/*.md
do
    echo "\fancyfoot[C]{Generated PDF - $(date)}" | cat - $file > temp && mv temp $file
    echo "\fancyfoot[L]{\thepage}" | cat - $file > temp && mv temp $file
    echo "\fancyfoot{}" | cat - $file > temp && mv temp $file
    echo "\pagestyle{fancy}" | cat - $file > temp && mv temp $file

    echo "\newpage" >> $file; 
    x=`tail -n 1 $file`
    if [ "$x" != "" ]; then echo "" >> $file; fi
done


# replace all includes to have absolute path, because PDF generation doesn't resolve the relative paths
# /var/relative_to_absolute_path.py

# Merge files

find . -type f -name "*.md" | xargs cat > $INTERMEDIATE_MD_FILENAME

for file in **/*.md; do
    pandoc -s --pdf-engine xelatex \
            --filter=pandoc-plantuml \
            -H /var/packages.tex \
            --from=markdown $file \
            --output="$(echo "$file" | awk -F "." '{print $1}').pdf" &
done

wait


# Generate PDF
rm ../doc/*.pdf -f
mv **/*.pdf ../doc -f
