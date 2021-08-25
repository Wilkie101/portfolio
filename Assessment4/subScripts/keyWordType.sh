#!/bin/bash
# Purpose: Trial reomving the function for a case statement from head of script.
# Author: David Wilkinson
# Created Date: Mon Aug 24 16:00:300 AEST 2021

# START

# Defining all of the colours
BLUE='\e[1;34m'
NC='\e[1;0m'
# set at to 0
kt=0

# Error Handling
printError() {
    echo -e "\033[31mERROR:\033[0m $1"
}

headline=~/student/scripts/portfolio/Assessment4/subScripts/headline.txt
          
while [ "$kt" -le "5" ];
echo -e "\n\n"
echo -e "         ${BLUE}Filter headings by Keyword...\n${NC}"
echo -e "         ${BLUE}1. Ransomware Alerts${NC} \n"
echo -e "         ${BLUE}2. Malware Alerts${NC} \n"
echo -e "         ${BLUE}3. Vulnerability Alerts${NC} \n"
echo -e "         ${BLUE}4. Exploit Alerts${NC} \n"
echo -e "         ${BLUE}5. Exit to main menu${NC}\n"
read -p "         Select from 1 to 5: " kt

    while (( "$kt" < "1" || "$kt" > "6" )); do
            printError " Entry must be a number between 1 and 5:"
            read -p "         Please retry with a valid selection:" kt
    done
do
# This case adds in the grep keyword search options, printing 1 line after the match to include the heading.
case $kt in
1) grep --color -iEA 1 'Ransomware' "$headline";;
2) grep --color -iEA 1 'Malware' "$headline";;
3) grep --color -iEA 1 'Vulnerabilit(y|ies)' "$headline";;
4) grep --color -iEA 1 'Exploit' "$headline";;
5) break;;
esac
done


# END