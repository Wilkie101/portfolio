#!/bin/bash
# Purpose: Display a table of alerts
# Author: David Wilkinson
# Created Date Mon Aug 23 2021

heading=~/student/scripts/portfolio/Assessment4/subScripts/heading.txt
alert=~/student/scripts/portfolio/Assessment4/subScripts/alert.txt

> "$alert"

# START

printf '%s: ' Type-Ransomware >> "$alert"; grep -nci 'Ransomware' "$heading" >> "$alert"
printf '%s: ' Type-Malware >> "$alert"; grep -nci 'Malware' "$heading" >> "$alert"
printf '%s: ' Type-Exploit >> "$alert"; grep -nci 'Exploit' "$heading" >> "$alert"
printf '%s: ' Type-Scam >> "$alert"; grep -nci 'Scam' "$heading" >> "$alert"
printf '%s: ' Type-Vulnerability >> "$alert"; grep -nci 'Vulnerabilit(y|ies)' "$heading" >> "$alert"
printf '%s: ' Type-Compromise >> "$alert"; grep -nci 'Compromise' "$heading" >> "$alert"
printf '%s: ' Type-DDos >> "$alert"; grep -nci 'DDos' "$heading" >> "$alert"
printf '%s: ' Sextortion >> "$alert"; grep -nci 'Sextortion' "$heading" >> "$alert"
printf '%s: ' Malicious >> "$alert"; grep -nci 'Malicious' "$heading" >> "$alert" 
printf '%s: ' Releases >> "$alert"; grep -nci 'Releases' "$heading" >> "$alert"
printf '%s: ' Phone-Vector >> "$alert"; grep -nci 'Phone' "$heading" >> "$alert"
printf '%s: ' SMS-Vector >> "$alert"; grep -nci 'SMS' "$heading" >> "$alert"
printf '%s: ' Email-Vector >> "$alert"; grep -nci 'Email' "$heading" >> "$alert"
printf '%s: ' Software-Vector >> "$alert"; grep -nci 'Software' "$heading" >> "$alert"
printf '%s: ' Threat-Actors >> "$alert"; grep -nci 'actors' "$heading" >> "$alert"
printf '%s: ' Cyber-Criminal >> "$alert"; grep -nci 'Criminal' "$heading" >> "$alert"
printf '%s: ' Target-Business >> "$alert"; grep -nci 'Business' "$heading" >> "$alert"
printf '%s: ' Target-Health-Industry >> "$alert"; grep -nci 'Health' "$heading" >> "$alert"
printf '%s: ' Target-Individuals >> "$alert"; grep -nci 'Australians' "$heading" >> "$alert"
printf '%s: ' Registered-CVE >> "$alert"; grep -nc 'CVE' "$heading" >> "$alert"

sort -o "$alert"{,}

echo -e "\n \033[36mTrending Key-words:\033[0m" 

awk 'BEGIN {
    FS=":";
    print "____________________________________";
        print "| \033[34mKey-Word               \033[0m | \033[34m Count\033[0m |";
        print "|_________________________|________|"; 
}
{   
    printf ("| \033[33m%-23s\033[0m | \033[35m%-6s\033[0m |\n", $1, $2);
}

END {
    print("|_________________________|________|");
}' "$alert"


exit 0

# GREP cheat sheet. staff.washington.edu
# https://staff.washington.edu/weller/grep.html
#
# Gite, Vivek. (2021, June 03). Regular expressions in grep ( regex ) with examples. cyberciti.biz
# https://www.cyberciti.biz/faq/grep-regular-expressions/ 
#
# Sathiyamoorthy. (2009, March 26). 15 Practical Grep Command Examples In Linux / UNIX. thegeekstuff.com
# https://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/
