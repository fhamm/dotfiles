#!/bin/sh

# Check if user is root
if [ "$(id -u)" -ne 0 ]; then
    echo 'This script must be run by root' >&2
        exit 1
fi

# Find mirror
read MIRROR < <(curl -s http://mirrors.ubuntu.com/mirrors.txt | xargs -n1 -I {} sh -c 'echo `curl -r 0-102400 -s -w %{speed_download} -o /dev/null {}/ls-lR.gz` {}' |sort -g -r |head -1| awk '{ print $2  }') 

# Replace mirror
echo $MIRROR
