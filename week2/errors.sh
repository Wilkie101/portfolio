#!/bin/bash
# Purpose: We were tasked with using debug to validate broken script, I used bash -x to get to the below
# Author: David Wilkinson
# Created Date Mon Jul 26 21:40:15 AEST 2021

# start #

read -sp " whats the secret code?" REPLY # moved to top of the code, and passed user input to  var


secret=shhh #Don't tell anyone! ## removed the apostrophe from shhh otherwise imppossible to match 

#if the user types in the correct secret, tell them they got it right!
# I validated this by comparing to my passwordCheck.sh script
# also added in double square brackets to correct the if and put reply in double "
#adjusted the formatting and spacing to group functions, it helps me read it.

if [[ "$secret" = "$REPLY" ]]; then 
	echo # new line for formatting
	echo "You got it right!"
	correct=true

else
	echo # new line for formatting
	echo "You got it wrong :("
	correct=false

fi

#removed an unnecessary echo which was printing case

case $correct in # i validated the correct syntax using my menu.sh script

false)

    echo "Go Away!" #people who get it wrong need to be told to go away!

;;

true)

    echo "you have unlocked the secret menu!"
    #TODO: add a secret menu for people in the know.

;;

esac


# finish #
