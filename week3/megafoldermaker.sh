#!/bin/bash
# Purpose: to create folders at scale using for and if to only make 1 folder not duplicates but keep looping
# Author: David Wilkinson
# Created Date Sat Jul 31 18:08:43 AEST 2021

# start #


#If there aren't two arguments to the script 
read -p "Enter numbers one: " n1

read -p "Enter number two: " n2



#For every number between the first argument and the last 

for (( i = $n1; i <= $n2; i++ )) 

do

    #Create a new folder for that number 

    echo "Creating directory number $i" 

    mkdir "week$i" 

done


# finish #
