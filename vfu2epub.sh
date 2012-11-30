#!/bin/sh

# unzip the archive
unzip -o $1 -d ./out
# unzip the archives
for z in ./out/vfu0*.zip; do unzip -o $z  -d ./out; done


# clean afterwards
rm ./out/*
