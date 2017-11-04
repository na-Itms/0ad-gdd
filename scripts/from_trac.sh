#!/bin/sh

cd "$(dirname $0)"/../trac/

for file in *; do
  name=${file##*/}
  basename=${name%.*}

  sed -i -e 's/\[\[BR\]\]//g' -e 's/\[\[TOC\]\]//g' "$basename".wiki

  pandoc -f mediawiki -t markdown_strict -o ../output/"$basename".md "$basename".wiki

  sed -i 's/`//g' ../output/"$basename".md
done
