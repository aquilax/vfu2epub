#!/bin/bash

# unzip the archive
unzip -o $1 -d ./temp

# unzip the archives
for z in ./temp/vfu0*.zip; do unzip -o $z  -d ./temp; done

# convert to utf8
for z in ./temp/VFU.0*; do iconv -f MIK -t utf8 $z -o $z.utf8.txt; done

# create HTML
for z in ./temp/*.utf8.txt; do sed "10r $z" ./assets/template.html | tidy -utf8 --force-output true >  $z.xhtml; done

# combine the files with the book template
cp -r ./assets/book ./temp
cp ./temp/*.xhtml ./temp/book/OEBPS/

# create the epub
pushd temp/book
zip -r ../../out/virus_for_us.epub *
popd

# clean afterwards
rm -r ./temp/*
