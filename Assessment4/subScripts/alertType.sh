#!/bin/bash
# Purpose: Trial reomving the function for a case statement from head of script.
# Author: David Wilkinson
# Created Date: Mon Aug 24 16:00:300 AEST 2021

# START

# Defining all of the colours
BLUE='\e[1;34m'
NC='\e[1;0m'
# set at to 0
at=0

# Error Handling
printError() {
    echo -e "\033[31mERROR:\033[0m $1"
}

headline=~/student/scripts/portfolio/Assessment4/subScripts/headline.txt

# This case adds in the grep keyword search options, printing 1 line after the match to include the heading.
while [ "$at" -le "5" ];

echo -e "\n\n"
echo -e "         Pick the alert headings you want to read...\n"
echo -e "         ${BLUE}1. Critical Alerts${NC} \n"
echo -e "         ${BLUE}2. High Alerts${NC} \n"
echo -e "         ${BLUE}3. Medium Alerts${NC} \n"
echo -e "         ${BLUE}4. Low Alerts${NC} \n"
echo -e "         ${BLUE}5. Exit to main menu${NC}\n"
read -p "         Select from 1 to 5: " at

    while (( "$at" < "1" || "$at" > "6" )); do
            printError "  Entry must be a number between 1 and 5: "
            read -p "         Please retry with a valid selection:" at
    done
do
# This case adds in the grep keyword search options, printing 1 line after the match to include the heading.
case $at in
1) grep --color -EA 1 'CRITICAL' "$headline";;
2) grep --color -EA 1 'HIGH' "$headline";;
3) grep --color -EA 1 'MEDIUM' "$headline";;
4) grep --color -EA 1 'LOW' "$headline";;
5) break;;
esac
done

# END