#!/bin/bash

# BASH

echo "Configuring Bash"

cat bashrc >> .bashrc

rm bashrc

echo "Done!"

# VIM

echo "Configuring Vim..."

# Download Vim configuration file

GITFILE="https://raw.githubusercontent.com/fhamm/linux/master/vimrc"

echo "Downloading file from $GITFILE"

wget -q -O .tvimrc $GITFILE

#if [ $? -ne 0 ]
#then 
#    echo "Download succeded!"
#else 
#    echo "Error in file download..." 
#    exit
#fi

# Updates Vim configuration file

VIMCONF=".vimrc"

if [ -f $VIMCONF ];
then
    echo "A Vim configuration file already exists."

    while true; do
        read -p "Overwrite [Y/n]?" yn
        case $yn in
            [Yy]* ) mv .tvimrc .vimrc; break;;
            [Nn]* ) rm .tvimrc; exit;;
            * ) echo "Please answer [Y/n] .";;
        esac
    done
else
    echo "No Vim configuration file detected." 

    while true; do
        read -p "Create vim configuration file [Y/n]?" yn
        case $yn in
            [Yy]* ) mv .tvimrc .vimrc; break;;
            [Nn]* ) rm .tvimrc; exit;;
            * ) echo "Please answer [Y/n] .";;
        esac
    done
fi

rm vimrc

echo "Done!"
