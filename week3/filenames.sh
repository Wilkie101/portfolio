#!/bin/bash
# Purpose: To read a file and make a decision
# Author: David Wilkinson
# Created Date Sat Jul 31 18:35:50 AEST 2021

# start #

file=$1

OLDIFS=$IFS # TO REVERT AT END OF SCRIPT

IFS=$'\n'

# PASS THE CONTENTS OF THE FILE INTO THE VAR FILE
for line in $(cat < "$file");
do

# EXECUSTE EACH OF THE VAILIDATIONS WITHIN IF AND ELIF COMMANDS
if [ -d $line ];then
    echo "$line That is a directory"
elif [ -f $line ];then
    echo "$line That is a file"
elif [ -e $line ];then
    echo "$line That file exists"
else
    echo "$line I dont know what that is!"

fi

done
IFS=$OLDIFS # TO REVERT IFS
exit 1
# finish #

# NOTES
# I HAD SOME TROUBLE ATTEMPTING TO FIT THIS ASSIGNMENT INTO A READ WHILE LOOP
# AFTER GUIDANCE FROM SONI, I REPLACED THE READ WHILE WITH A FOR LOOP
# I ALSO REMOVED THE DIRECT CALL FOR FILE AND REPLACED WITH COMMAND LINE INPUT
# I REMOVED SOME OF THE ECHO'S AS I DID NOT LIKE THEM IN THE OUTPUT
# I MOVED THE EXIT AS IT WAS EXITING AFTER 1 RUN
# GOOD LESSON

#References
# Stanford Journalism. (2021). For and Read-While Loops in Bash. http://www.compciv.org/topics/bash/loops/
# sed -z 's/\n/ /g'
# | tr -d "\n"
