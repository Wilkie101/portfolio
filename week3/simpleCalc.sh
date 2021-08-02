#!/bin/bash
# Purpose: A simple calculator with a bit of colour!
# Author: David Wilkinson
# Created Date Wed Jul 28 18:04:05 AEST 2021
# Version: adding in the BC function and for loop

# start #

BLUE='\e[1;34m'
GREEN='\e[1;32m'
RED='\e[1;31m'
PURPLE='\e[1;35m'
CYAN='\e[0;36m'
NC='\e[1;0m'
choice=0

echo
echo
echo -e "${BLUE}Welcome to...${NC} \n"
toilet -f standard --filter border:gay "My Calculator"
echo

while [ $choice -le 4 ];

echo -e "What kind of calculation would you like to do? \n"

echo -e "   1. ${BLUE}Add${NC} 2 numbers \n"
echo -e "   2. ${GREEN}Subtract${NC} 2 numbers \n"
echo -e "   3. ${RED}Multiply${NC} 2 numbers \n"
echo -e "   4. ${PURPLE}Divide${NC} 2 Numbers \n"
echo -e "   5. ${CYAN}Exit My Calculator${NC} \n" 
read -p "Enter your choice 1-5: " choice
do

if [[ $choice -le 4 ]]; then
echo
read -p " Enter your first number: " n_one
echo
read -p " Enter your second number: " n_two
echo
fi

case $choice in
1)
echo
echo -e "${BLUE}You have chosen to Add $n_one & $n_two together${NC} \n"
result=`echo -e "scale=2; $n_one + $n_two " | bc`
echo -e "${BLUE}The answer is $result ${NC}"
echo 
;;

2)
echo
echo -e "${GREEN}You have selected to Subtract $n_two from $n_one ${NC} \n"
result=`echo -e "scale=2; $n_one - $n_two " | bc`
echo -e "${GREEN}The answer is $result ${NC}" 
echo
;;

3)
echo
echo -e "${RED}You have selected to Multiply $n_one & $n_two${NC} \n"
result=`echo -e "scale=2; $n_one * $n_two " | bc`
echo -e "${RED}The answer is $result ${NC}"
echo
;;

4)
echo
echo -e "${PURPLE}You have selected to Divide numbers $n_two into $n_one${NC} \n"
result=`echo -e "scale=2; $n_one / $n_two " | bc`
echo
;;

5)
echo
echo -e "Goodbye, come back soon!!\n"
exit 0
;;

*)
echo -e "That is an invalid selection, please try harder next time. \n"
exit 0
;;
esac
done

# finish #
