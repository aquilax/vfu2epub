#!/bin/sh

# unzip the archive
unzip -o $1 -d ./out

# unzip the archives
for z in ./out/vfu0*.zip; do unzip -o $z  -d ./out; done

# convert to utf8
for z in ./out/VFU.0*; do iconv -f MIK -t utf8 $z -o $z.utf8.txt; done

# create HTML
for z in ./out/*.utf8.txt; do sed "9r $z" ./assets/template.html > $z.xhtml; done

# clean afterwards
rm ./out/*
