#!/bin/bash
# Purpose: Design a guessing game for users where they enter a number
# Author: David Wilkinson
# Created Date: Thu Aug 5 20:34:51 AEST 2021
# Version: Alot of time spent on this, managed to get it working just not 100% the way i wanted. 
# Rajesh Soni offered a fomat that would work so I adapted to match it. 
# As I used a reference effectively I added in some spice with a random number selector for the target.

# start #

GREEN='\e[1;32m'
BLUE='\e[1;34m'
CYAN='\e[1;36m'
YELLOW='\e[1;33m'
NC='\e[1;0m'
Goal=$( shuf -i 1-100 -n 1 )

#This function prints a given error 
      
printError() 
{ 
    echo -e "\033[31mERROR:\033[0m $1" 
} 
      
 
      
#This function will get a value between the 2nd and 3rd arguments 
      
getNumber() 
  
{ 
    while [[ $REPLY -ne $Goal ]]; do
    read -p "$1: " 
    if [[ $REPLY -lt $2 || $REPLY -gt $3 ]];then
        printError "Input must be a number between $2 and $3"
            read -p "$1: " 
fi
    if [[ $REPLY -lt $Goal && $REPLY -gt $2 ]];then
        echo -e "${BLUE}Number is low!${NC}" 
        
    elif [[ $REPLY -gt $Goal && $REPLY -lt $3 ]];then
        echo -e "${YELLOW}Number is High!${NC}"
          
    elif (( $REPLY == $Goal ));then
        toilet -f smblock --filter border:gay "You are Correct!"
        exit 0

    fi
    
    done

}

echo -e "\n${CYAN}Lets Begin!${NC}"
# echo "$Goal" enable this option if you are testing and do not actually want to test the script
getNumber "Please type a number between 1 and 100" 1 100


# finish #

# REFERENCES
# knipwim (2016, Aug 10) How to generate random number in Bash?, Stack Overflow
# https://stackoverflow.com/questions/1194882/how-to-generate-random-number-in-bash/1195035