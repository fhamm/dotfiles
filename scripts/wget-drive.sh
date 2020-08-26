#!/bin/bash

# Google Drive wget tool
# Made by github.com/fhamm

url=$1

# Check if url is valid
if [[ $url == *'drive.google.com/file/d/'* ]] && [[ $url == *'/view?usp=sharing' ]]; then
    valid=true
else
    valid=false
fi 

if [[ $valid == false ]]; then
    echo "Invalid url!"
    exit 1
fi

# Get fileid
fileid=$(echo $url | grep -o -P '(?<=d/).*(?=/view)')

# Download file 
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=${fileid}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${fileid}" --content-disposition && rm -rf /tmp/cookies.txt
