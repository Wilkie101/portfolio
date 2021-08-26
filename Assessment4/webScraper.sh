#!/bin/bash
# Purpose: This is the main script to scrape the ACSC alerts page, look at and analyse the data from there.
# Author: David Wilkinson
# Created Date Sat Aug 21 18:02:36 AEST 2021

# start #

# Define all of the colours
BLUE='\e[1;34m'
GREY='\e[1;30m'
GREEN='\e[1;32m'
RED='\e[1;31m'
LTBLUE='\e[1;94m'
NC='\e[1;0m'

# sett variables to 0
menu=0
choice=0
at=0
gr_ch=0

# Error Handling
printError() {
    echo -e "\033[31mERROR:\033[0m $1"
}

# run the shell passwordCheck
bash ~/student/scripts/portfolio/week2/passwordCheck.sh

# If statement using system variable $? for last process ie. passworCheck and the way it exited
if [ $? = 1 ]
then
      echo "You are not authorised, exiting program"
      exit 0
else 
# fire the extract script to get the data
bash ~/student/scripts/portfolio/Assessment4/subScripts/extract.sh

echo -e "${BLUE}\n\nFor my Assessment 4 in Scripting Languages, I have decided to scrape the Australian Cyber${NC} \n"
echo -e "${BLUE}Security Center's (ACSC) Alert pages for information on recent Cyber Security threats. ${NC} \n"
echo -e "${BLUE}These threats are catagorised by Alert Type and Keyword. Please Enjoy...${NC} \n"
echo -e "${BLUE}\n    webScraper by David Wilkinson..${NC} \n"
echo
fi
# start the menu loop
while [ "$menu" -le "8" ];

      echo -e "${CYAN}\n   What and how would you like to view your ACSC alerts?${NC} \n"

      echo -e "   ${BLUE}1. Look at all headlines with Alert and Date, space for next page, Q to exit.${NC} \n"
      echo -e "   ${BLUE}2. Read alert headlines by criticality${NC} \n"
      echo -e "   ${BLUE}3. Read headlines by threat KeyWord${NC} \n"
      echo -e "   ${BLUE}4. Count the alerts by Criticality${NC} \n"
      echo -e "   ${BLUE}5. Count Alerts by keyword${NC} \n"
      echo -e "   ${BLUE}6. Download a copy of alert page details to file, space for next page, Q to exit.${NC} \n"
      echo -e "   ${BLUE}7. Set a Password${NC} \n"
      echo -e "   ${BLUE}8. Exit${NC} \n"
      read -p "   Select from 1-8: " menu

     # Error manage incorrect input 
    while (( $((menu)) != "$menu" || "$menu" < "1" || "$menu" > "9" || "$menu" == "0" )); do
            printError "  Entry must be a number between 1 and 8: "
            read -p "         Please retry with a valid selection:" menu
    done
do

# Case statement actions for the above menu
# all actions of the case menu are calls to separate scripts
case $menu in
1) bash ~/student/scripts/portfolio/Assessment4/subScripts/showHeadline.sh;;

2) bash ~/student/scripts/portfolio/Assessment4/subScripts/alertType.sh;;

3) bash ~/student/scripts/portfolio/Assessment4/subScripts/keyWordType.sh;;

4) bash ~/student/scripts/portfolio/Assessment4/subScripts/critTable.sh;;

5) bash ~/student/scripts/portfolio/Assessment4/subScripts/wordTable.sh;;

6) bash ~/student/scripts/portfolio/Assessment4/subScripts/curlAll.sh;;

7) bash ~/student/scripts/portfolio/week2/setPassword.sh;;

8) echo -e "${RED} \n Come back soon, Goodbye!!!! \n ${NC}"
exit 0
;;
esac


done



# finish #
