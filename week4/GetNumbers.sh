#!/bin/bash
# Purpose: This function prints a given error, provided in week4.2
# Author: David Wilkinson
# Created Date Thu Aug 5 19:54:39 AEST 2021


# start #


#This function prints a given error 

printError() 

{
    echo -e "\033[31mERROR:\033[0m $1"

}



#This function will get a value between the 2nd and 3rd arguments

getNumber()

{
# takes user input
    read -p "$1: "

# the condition here will be less than 1 and higher than 100
    while (( $REPLY < $2 || $REPLY> $3 )); do

            printError "Input must be between $2 and $3"
# provides an out for the while loop
            read -p "$1: "

    done

}



echo "This is the start of the script"

getNumber "please type a number between 1 and 10" 1 10

echo "Thank you!"

getNumber "please type a number between 50 and 100" 50 100

echo "Thank you!"


# Finish #
