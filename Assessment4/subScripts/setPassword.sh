#!/bin/bash
# Author: David Wilkinson
# Purpose: This will prompt a user for a folder name and secret password
# Version: This is version 2.1 
# added -n to the echo to remove the return character
# Purpose: This will prompt a user for a folder name and secret password
# Date: 21/07/2021 20:48

# Start #

# asks user for the folder name to save into
# read -p "Where would you like to save your secret? " folder_var this was ok while it was only used in week2 folder

#takes the password
read -sp "Please type the password you would like to save to file:" pass_var
echo 


#sends the hash output to file
echo -n $pass_var | sha256sum > ~/student/scripts/portfolio/Assessment4/subScripts/secret.txt 

# finish #
exit

