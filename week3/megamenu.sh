#!/bin/bash
# Purpose: Shell to call other scripts within a script using case
# Author: David Wilkinson
# Created Date Mon Jul 26 15:18:19 AEST 2021

# start #
#set the colour variables
BLUE='\e[1;34m'
GREY='\e[1;30m'
GREEN='\e[1;32m'
YELLOW='\e[1;93m'
RED='\e[1;31m'
LTBLUE='\e[1;94m'
PURPLE='\e[1;35m'
CYAN='\e[1;36m'
NC='\e[1;0m'
menu=0

#run the shell passwordCheck with bash # (Shah et al., 2019)
bash ~/student/scripts/portfolio/week2/passwordCheck.sh

# If statement using system variable $? for last process ie. passworCheck and the way it exited
if [ $? = 1 ] # (Soni, 2021)
then
      echo "Exit stage left"
      exit 0
else # (Buzdar, 2019)


echo
echo
echo -e "${BLUE}Welcome to...${NC} \n"
toilet -f standard --filter border:gay "MegaMenu"
echo
fi

while [ "$menu" -le "7" ];

      echo -e "${CYAN}What action would you like to perform?${NC} \n"

      echo -e "${BLUE}1. Create a folder${NC} \n"
      echo -e "${GREY}2. Copy a folder${NC} \n"
      echo -e "${CYAN}3. Set a password${NC} \n"
      echo -e "${LTBLUE}4. Calculator${NC} \n"
      echo -e "${PURPLE}5. Create Week Folders${NC} \n"
      echo -e "${GREEN}6. Check Filenames${NC} \n"
      echo -e "${YELLOW}7. Download a File${NC} \n"
      echo -e "${RED}8. Exit${NC} \n"
      
      read -p "Select from 1-8: " menu
do



#Start the case match using var usr_choice # (Buzdar, 2019)
case $menu in
1)
bash ~/student/scripts/portfolio/week2/foldermaker.sh
;;
2)
bash ~/student/scripts/portfolio/week2/foldercopier.sh
;;
3)
bash ~/student/scripts/portfolio/week2/setPassword.sh
;;
4)
bash ~/student/scripts/portfolio/week3/simpleCalc.sh
;;
5)
read -p "please enter two numbers"
bash ~/student/scripts/portfolio/megafoldermaker.sh
;;
6)
./filenames.sh
;;
7)
bash ~/student/scripts/portfolio/week3/filedownloader.sh
;;
8)
exit 0
;;
esac

done
# finish #
# I used the below sites for some background information on my code.

# R, Soni (2021, July 26) Email: Another Aproach. 
# K. Buzdar (2020) How to use bash case statement. linuxhint. https://linuxhint.com/bash_case_statement/
# K. Buzdar (2020) Bash: IF, Else If Else Examples. linuxhint. https://linuxhint.com/bash_case_statement/
# S.Shah & Flinsch (2019, Dec 9) How to call one shell script from another shell script? 
# https://stackoverflow.com/questions/8352851/how-to-call-one-shell-script-from-another-shell-script/8352939