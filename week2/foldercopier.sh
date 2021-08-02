#!/bin/bash
# Purpose: This script is to copy a folder and it's contents, it was provided in week 2 content.
# Author: David Wilkinson
# Created Date Mon Jul 26 18:22:29 AEST 2021

# start #


read -p "type the name of the folder you would like to copy: " folderName 

#if the name is a valid directory 

if [ -d "$folderName" ]; then 

    #copy it to a new location 

    read -p "type the name of the destination folder: " newFolderName 

    cp -r "$folderName" "$newFolderName" 

else

    #otherwise, print an error 

    echo "I couldn't find that folder" 

fi


# finish #
