#!/bin/bash

# Purpose: Compare the password entered to what is in secret file
# Author: David Wilkinson
# Version 199.999
# Created Date Wed Jul 21 19:06:38 AEST 2021

# start #

# Start with asking for a password
read -sp "Please type your password:" usr_pass
echo
export hsh_pass=$(printf $usr_pass | sha256sum ) # export pushes the hash value into a new var hsh_pass


# Retreive the password from file and put it in a var
sec_pass=$(grep -E -i '[0-9a-zA-Z -]{64}' ~/student/scripts/portfolio/week2/secret.txt)


# The comparison
if [[ "$hsh_pass" = "$sec_pass" ]]
then 
    echo "Access Granted" 
    exit 0
else
    echo "Access Denied"
    exit 1

fi 


# looked at erors here for the if comparison https://stackoverflow.com/questions/13781216/meaning-of-too-many-arguments-error-from-if-square-brackets
# looked here for info on if statements https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
# looked here for info on why not to use echo with hashes https://superuser.com/questions/71554/why-is-my-command-line-hash-different-from-online-md5-hash-results
# looked here for info on export https://askubuntu.com/questions/581922/export-display-value-in-shell-script
# i am listening to this guy for tips https://www.youtube.com/watch?v=uI-xHPk4tO0
# more info on variables https://devconnected.com/set-environment-variable-bash-how-to/
# i am sure there are more i read, these are the main ones where i picked somethign up or it finally clicked.#
