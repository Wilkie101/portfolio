#!/bin/bash
# Purpose: Shell to call other scripts within a script using case
# Author: David Wilkinson
# Created Date Mon Jul 26 15:18:19 AEST 2021

# start #
#run the shell passwordCheck with bash # (Shah et al., 2019)
bash passwordCheck.sh 

# If statement using system variable for last process
if [ $? = 1 ] # (Soni, 2021)
then
      echo "Exit stage left"
      exit 0
else # (Buzdar, 2019)
      echo 
      echo "1. Create a folder"
      echo "2. Copy a folder"
      echo "3. Set a password"
      read usr_choice
fi

#Start the case match using var usr_choice # (Buzdar, 2019)
case $usr_choice in
1)
bash foldermaker.sh
;;
2)
bash foldercopier.sh
;;
3)
bash setPassword.sh
;;
esac
# finish #
# I used the below sites for some background information on my code.

# R, Soni (2021, July 26) Email: Another Aproach. 
# K. Buzdar (2020) How to use bash case statement. linuxhint. https://linuxhint.com/bash_case_statement/
# K. Buzdar (2020) Bash: IF, Else If Else Examples. linuxhint. https://linuxhint.com/bash_case_statement/
# S.Shah & Flinsch (2019, Dec 9) How to call one shell script from another shell script? 
# https://stackoverflow.com/questions/8352851/how-to-call-one-shell-script-from-another-shell-script/8352939