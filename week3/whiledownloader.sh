#!/bin/bash
# Purpose: Ask a user for a filename they would like to download
# Author: David Wilkinson
# Created Date Sun Aug 1 18:01:56 AEST 2021

# start #

while true; do

read -p "Please enter the file URL you would like to download (or type exit to exit): " file_url

if [[ $file_url = *www.* ]]; then
    read -p "What Desktop Folder would you like to save in?" folder
    wget -c --directory-prefix=/home/Desktop/$folder $file_url
    echo "Your file has been downloaded to your Desktop $folder"

elif [[ $file_url = "exit" || $file_url = "Exit" || $file_url = "EXIT" ]]; then
exit 0
else
exit 0
fi

done

# finish #