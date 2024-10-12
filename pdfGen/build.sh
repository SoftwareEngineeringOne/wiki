#!/bin/bash

shopt -s globstar

cp -r /var/doc/* .

PDF_FILE_NAME='all.pdf'
BASE_DIR=$(pwd)

# Add new line to every file if missing
for file in **/*.md
do
    echo '\newpage' >> $file; 
    x=`tail -n 1 $file`
    if [ "$x" != "" ]; then echo "" >> $file; fi
done


# replace all includes to have absolute path, because PDF generation doesn't resolve the relative paths
# /var/relative_to_absolute_path.py

# Merge files

find . -type f -name "*.md" | xargs cat > $INTERMEDIATE_MD_FILENAME

for file in **/*.md; do
    pandoc -s --pdf-engine xelatex --filter=pandoc-plantuml \
            --from=markdown $file \
            --output="$(echo "$file" | awk -F "." '{print $1}').pdf" &
done

wait


# Generate PDF
mv **/*.pdf ../doc -f
