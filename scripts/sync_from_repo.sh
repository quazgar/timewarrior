#!/bin/bash -e

# Copy data from this repository to the timewarrior data folder.

sed -i -e 's/},"/},\
"/g' ~/.timewarrior/data/tags.data

sed -i -e 's/},"/},\
"/g' timewarrior/data/tags.data

for f in timewarrior/data/*.data; do
    target="${HOME}/.timewarrior/data/$(basename $f)"
    if ! diff --new-file -u "$target" "$f"; then
        echo cp -i "$f" "$target"
        cp -i "$f" "$target"
    else
        echo "Skipping (no changes found) $f"
    fi
done
