#!/bin/bash
# Purpose: Display a table of alerts
# Author: David Wilkinson
# Created Date Mon Aug 23 2021

headline=~/student/scripts/portfolio/Assessment4/headline.txt
alert=~/student/scripts/portfolio/Assessment4/alert.txt

# START

> "$alert"

printf '%s: ' CRITICAL > "$alert"; grep --color -onEc 'CRITICAL'  "$headline" >> "$alert" 
printf '%s: ' HIGH >> "$alert"; grep --color -onEc 'HIGH'  "$headline" >> "$alert" 
printf '%s: ' MEDIUM >> "$alert"; grep --color -onEc 'MEDIUM' "$headline" >> "$alert" 
printf '%s: ' LOW >> "$alert"; grep --color -onEc 'LOW' "$headline" >> "$alert"  

echo -e "\n \033[36mThe severity count is:\033[0m" 

awk 'BEGIN {
    FS=":";
    print "__________________________";
        print "| \033[34mCriticality  \033[0m | \033[34m Count\033[0m |";
        print "|_______________|________|"; 
}
{   
    printf ("| \033[33m%-13s\033[0m | \033[35m%-6s\033[0m |\n", $1, $2);
}

END {
    print("|_______________|________|");
}' "$alert"

exit 0