#!/bin/bash

in_exts=("mp4" "mov" "wmv" "flv" "mkv" "webm")
out_ext="avi"
fps=5

for ext in "${in_exts[@]}"
do
    echo "Searching for $ext files..."
    files="$(find $directory -type f -name "*.${ext}")"
    for file in $files; do
        fbname=$(basename "$file" | cut -d. -f1)
        eval "ffmpeg -i ${file} -r ${fps} -max_interleave_delta 0 -qscale 0 -c:v libx264 -preset slower -crf 17 -c:a copy -y ${fbname}.${out_ext} -async 1 -vsync 1"
    done
done
