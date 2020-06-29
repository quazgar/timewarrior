#!/bin/bash

# Copy data from the timewarrior data folder to this directory.

for f in ~/.timewarrior/data/*.data; do
    if [[ $f == *undo* ]]; then
        continue;
    fi
    cp $f timewarrior/data/
done

# Not necessary anymore if timewarrior writes the tags as on per line.
sed -i -e 's/},"/},\
"/g' timewarrior/data/tags.data
