#!/bin/bash
# Purpose: To find
# Author: David Wilkinson
# Created Date Sat Aug 14 18:02:36 AEST 2021


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
ch=0
gr_ch=0

grepType()
{
# tried to loop this and it did not work well, so opted in the end not to loop
# embedded this in a function to provide further options to the grep query being run.
echo -e "\n\n"
echo -e "         ${BLUE}You have chosen to find "$gr_ch"\n${NC}"
echo -e "         ${BLUE}     You can refine your search further?\n${NC}"
echo -e "         ${BLUE}1. See the whole line without change${NC} \n"
echo -e "         ${BLUE}2. Output only what is matched${NC} \n"
echo -e "         ${BLUE}3. Look for the oposite of what was selected${NC} \n"
echo -e "         ${BLUE}4. Display the file names${NC} \n"
echo -e "         ${RED}5. EXIT Program${NC}\n"
read -p "         Please enter your selection: " ch

# This case statement adds in the different options to alter the output.
case $ch in
1) ch=r;;
2) ch=ro;;
3) ch=rv;;
4) ch=rl;;
*) exit 0;;
esac
}

# run the shell passwordCheck with bash # (Shah et al., 2019)
bash ~/student/scripts/portfolio/week2/passwordCheck.sh

# If statement using system variable $? for last process ie. passworCheck and the way it exited
if [ $? = 1 ] # (Soni, 2021)
then
      echo "Exit stage left"
      exit 0
else # (Buzdar, 2019)

echo -e "${BLUE}\n\nWelcome to...${NC} \n"
echo -e "${BLUE}       Grep101...${NC} \n"
echo
fi

# while loop for the menu so it will keep prompting user until exited
# resued the navigation menu, looking for how I will do nav for final project
while [ "$menu" -le "7" ];

      echo -e "${CYAN}\n      What grep would you like to action?${NC} \n"

      echo -e "   ${GREEN}1. Look for sed statements${NC} \n"
      echo -e "   ${GREEN}2. Look for lines starting with "m"${NC} \n"
      echo -e "   ${GREEN}3. Look for lines that contain 3 digit numbers${NC} \n"
      echo -e "   ${GREEN}4. Look for all echo statements with at least 3 words${NC} \n"
      echo -e "   ${GREEN}5. All lines that might make a good password${NC} \n"
      echo -e "   ${GREEN}6. Set a Password${NC} \n"
      echo -e "   ${RED}7. Exit${NC} \n"
      read -p "   Select from 1-7: " menu
do

# Case statement actions for the above menu
# I added a level of complexity, i am not sure if i should have, I call a case statement
# embedded in a function to provide further options to the query being run.
case $menu in
1) gr_ch="find sed commands"
grepType
grep --color -"$ch"inE '\b sed\b ' ~/student/scripts/portfolio/;;

2) echo "find lines starting with m"
grepType
grep --color -"$ch"inE '^m' ~/student/scripts/portfolio/;;

3) echo "find lines with 3 digit numbers"
grepType
egrep --color -"$ch"in '[[:digit:]]{3}' ~/student/scripts/portfolio/;;

4) echo "find echo statements with at least 3 words"
grepType
grep --color -w"$ch"inE 'echo .*(\w+){3} (\w+){3} (\w+){3}' ~/student/scripts/portfolio/;;

5) echo "find lines that have could be good passwords"
grepType
grep --color -"$ch"wnE '.*+[[:alnum:]]{8,}+[[:punct:]]{1,}+[[:digit:]]{1,}' ~/student/scripts/portfolio/;;

6) bash ~/student/scripts/portfolio/week2/setPassword.sh;;

7) echo -e "${RED} \n Lucky number "7" Goodbye!!!! \n ${NC}"
exit 0
;;
esac


done



# finish #
