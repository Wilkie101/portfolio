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
headline=~/student/scripts/portfolio/Assessment4/headline.txt

# This case adds in the grep keyword search options, printing 1 line after the match to include the heading.
while [ "$at" -le "5" ];

echo -e "\n\n"
echo -e "         ${BLUE}Pick the alert headings you want to read..."$gr_ch"\n${NC}"
echo -e "\n"
echo -e "         ${BLUE}1. Critical Alerts${NC} \n"
echo -e "         ${BLUE}2. High Alerts${NC} \n"
echo -e "         ${BLUE}3. Medium Alerts${NC} \n"
echo -e "         ${BLUE}4. Low Alerts${NC} \n"
echo -e "         ${BLUE}5. Exit to main menu${NC}\n"
read -p "         Please enter your selection: " at
do
# This case adds in the grep keyword search options, printing 1 line after the match to include the heading.
case $at in
1) grep --color -nEA 1 'CRITICAL' "$headline";;
2) grep --color -nEA 1 'HIGH' "$headline";;
3) grep --color -nEA 1 'MEDIUM' "$headline";;
4) grep --color -nEA 1 'LOW' "$headline";;
5) break;;
esac
done

# END