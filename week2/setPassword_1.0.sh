#!/bin/bash
#Author David Wilkinson

#this was me mis-interpretting what was required of the setpassword script, it works but is fundamentally wrong.

#this will prompt a user for a folder name and secret password

#asks user the new folder name and creates it
read -p "What would like to call your new folder? " folder_var
mkdir "$folder_var"
echo
echo -e "The folder \e[1;34m$folder_var\e[0m has been created in:" #confirmation of successful creation 

#shows path for new folder
readlink -f "$folder_var" 
echo 

#takes the password
read -sp "Please type the password you would like to save to file in the $folder_var folder:" pass_var
echo 


#sends the hash output to file
echo $pass_var | sha256sum > ~/student/scripts/portfolio/week2/secret.txt 
exit

