#!/bin/bash
dir=$(pwd)
mkdir "$dir"/modified
for file in "$dir"/*
do
        filename=$(basename -- "$file")
        extension="${filename##*.}"
        fname="${filename%.*}"
        if [ "$extension" = "txt" ];
        then

                cp "$filename" "$dir/modified/$fname".bak
        fi
done
