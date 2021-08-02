#!/bin/bash
# Purpose: Simple script to ask the user for a folder name and create it.
# Author: David Wilkinson
# Date: 20/07/21
# Version: 1.5

# Added context for path
# had some trouble in the begining with this attempting to get the echo command right
# in the end it was better to remove it
read -p "Type the name of the folder(and optional path) you would like to create: " folderName 

mkdir "$folderName" 
    exit 0
