#!/usr/bin/env bash
# Author: David Wilkinson
# Created: 17/08/2021
# Version 999999999
# this was the white elephant i could not get working. It would have had two piurposes.
#1 to url out to the actual page.
#2 to curl the page and show detail of the alert.
#but alas it was not meant to be... this time around.

#set the varibles for heading and url
#hdinglist=~/student/scripts/portfolio/Assessment4/subScript/heading.txt
#urllist=~/student/scripts/portfolio/Assessment4/subScript/url.txt

#urllist=url.txt
headlist=heading.txt

# Set up select
PS3='enter your choice: '
IFS=''

# start the loop to provide the array _url with info
while read -r index element; do
    _heading[index]=$element
done < <(awk -F\) '{print $1,$2}' "$headlist")

# start the loop to provide the array _url with info
#while read -r ndex element; do
#    _url[index]=$element
#done < <(awk -F\) '{print $1,$2}' "$urllist")

# start the build of the case statement with select
select i in "${_url[@]}"; do
    case $i in
        *)  echo "Choice is ${_heading[REPLY]}";;
#            echo "Your URL is www.cyber.gov.au/acsc/view-all-content/alerts/${_url[REPLY]}";;
           
    esac
done
#Jesse_B. July, 12, 2020. using case statement to read from a variable/file while creating a MENU. unix.stackexchange.com
#https://unix.stackexchange.com/questions/525622/using-case-statement-to-read-from-a-variable-file-while-creating-a-menu