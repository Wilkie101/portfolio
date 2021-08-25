#!/bin/bash
# Purpose: To scrape the ACSC alerts page, look at and analyse the data from there.
# Author: David Wilkinson
# Created Date Sat Aug 21 18:02:36 AEST 2021


# start #



# Defining all of the colours
BLUE='\e[1;34m'
GREY='\e[1;30m'
GREEN='\e[1;32m'
RED='\e[1;31m'
LTBLUE='\e[1;94m'
NC='\e[1;0m'

# setting variables to 0
menu=0
choice=0
at=0
gr_ch=0



# run the shell passwordCheck with bash # (Shah et al., 2019)
bash ~/student/scripts/portfolio/week2/passwordCheck.sh

# If statement using system variable $? for last process ie. passworCheck and the way it exited
if [ $? = 1 ] # (Soni, 2021)
then
      echo "Exit stage left"
      exit 0
else # (Buzdar, 2019)

bash ~/student/scripts/portfolio/Assessment4/subScripts/extract.sh

echo -e "${BLUE}\n\nFor my Assessment 4 in Scripting Languages I have decided to scrape the Australian Cyber${NC} \n"
echo -e "${BLUE}Security Center's (ACSC) Alert pages for information on recent Cyber Security threats ${NC} \n"
echo -e "${BLUE}These threats are catagorised by Alert Type and Keyword. Please Enjoy...${NC} \n"
echo -e "${BLUE}\n    WebScraper by David Wilkinson..${NC} \n"
echo
fi


while [ "$menu" -le "7" ];

      echo -e "${CYAN}\n   What and how would you like to view your ACSC alerts?${NC} \n"

      echo -e "   ${BLUE}1. Look at all headlines with Alert and Date, space for next page, Q to exit.${NC} \n"
      echo -e "   ${BLUE}2. Look at an alert headlines by criticality${NC} \n"
      echo -e "   ${BLUE}3. Read the headlines by Alert Type${NC} \n"
      echo -e "   ${BLUE}4. Count the alerts by Criticality${NC} \n"
      echo -e "   ${BLUE}5. Count Alerts by keyword${NC} \n"
      echo -e "   ${BLUE}6. Set a Password${NC} \n"
      echo -e "   ${BLUE}7. Exit${NC} \n"
      read -p "   Select from 1-7: " menu
do

# Case statement actions for the above menu
# I added a level of complexity, i am not sure if i should have, I call a case statement
# embedded in a function to provide further options to the query being run.
case $menu in
1) bash ~/student/scripts/portfolio/Assessment4/subScripts/showHeadline.sh;;

2) bash ~/student/scripts/portfolio/Assessment4/subScripts/alertType.sh;;

3) bash ~/student/scripts/portfolio/Assessment4/subScripts/keyWordType.sh;;

4) bash ~/student/scripts/portfolio/Assessment4/subScripts/critTable.sh;;

5) bash ~/student/scripts/portfolio/Assessment4/subScripts/wordCount.sh;;

6) bash ~/student/scripts/portfolio/week2/setPassword.sh;;

7) echo -e "${RED} \n Lucky number "7" Goodbye!!!! \n ${NC}"
exit 0
;;
esac


done



# finish #
