#!/bin/bash
# Purpose: Design a guessing game for users where they enter a number
# Author: David Wilkinson
# Created Date Thu Aug 5 20:34:51 AEST 2021

# start #

GREEN='\e[1;32m'
BLUE='\e[1;34m'
CYAN='\e[1;36m'
YELLOW='\e[1;33m'
NC='\e[1;0m'


#This function prints a given error 
      
printError() 
{ 
    echo -e "\033[31mERROR:\033[0m $1" 
} 
      
 
      
#This function will get a value between the 2nd and 3rd arguments 
      
getNumber() 
  
{ 
    while true; do
    read -p "$1: " 
    if (( $REPLY <$2 || $REPLY > $3 ));then
        printError "Input must be between $2 and $3"

    elif (( $REPLY < 42 ));then
        echo -e "${BLUE}Number is low!${NC}" 
        
    elif (( $REPLY > 42 ));then
        echo -e "${YELLOW}Number is High!${NC}"
          
    elif (( $REPLY == 42 ));then
        toilet -f smblock --filter border:gay "You are Correct!"
        exit 0

    else 
        printError "Try Again, Input must be between $2 and $3"

    fi
    
    done

}

echo -e "\n${CYAN}Lets Begin!${NC}"
getNumber "Please type a number between 1 and 100" 1 100


# finish #