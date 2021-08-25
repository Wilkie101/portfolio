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

headline=~/student/scripts/portfolio/Assessment4/headline.txt

while [ "$kt" -le "5" ];
echo -e "\n\n"
echo -e "         ${BLUE}Filter headings by Keyword..."$gr_ch"\n${NC}"
echo -e "         ${BLUE}1. Ransomware Alerts${NC} \n"
echo -e "         ${BLUE}2. Malware Alerts${NC} \n"
echo -e "         ${BLUE}3. Vulnerability Alerts${NC} \n"
echo -e "         ${BLUE}4. Exploit Alerts${NC} \n"
echo -e "         ${BLUE}5. Exit to main menu${NC}\n"
read -p "         Please enter your selection: " kt
do
# This case adds in the grep keyword search options, printing 1 line after the match to include the heading.
case $kt in
1) grep --color -inEA 1 'Ransomware'  "$headline";;
2) grep --color -inEA 1 'Malware' "$headline";;
3) grep --color -inEA 1 'Vulnerability' "$headline";;
4) grep --color -inEA 1 'Exploit' "$headline";;
5) break;;
esac
done


# END