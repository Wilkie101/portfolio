#!/bin/bash
#Author: David Wilkinson
#Date:	09/08/2021
#Version: 31:)
# Purpose: Validate the start of my Assessment 4 script. I want to sed out the url's to one file
#  and headings to another file so I can build a case statement out of them.

# Start #

> filtered.txt
> heading.txt
> url.txt


# curl the website for the contents of the html
curl -s -o output.txt https://www.cyber.gov.au/acsc/view-all-content/alerts

#set the var for the page
raw_txt="$(cat output.txt)"

#this removes the unwanted headings from the page
pass1=$(echo "$raw_txt" | sed -n '/content\/alerts\//{

s/content\/alerts\///
p
}')

# narrow down the data to work with so it is only the heading and URL
pass2=$(echo "$pass1" | sed -n '/<div class/{
s/<div class.*<a //
s/href="\/acsc\/view-all-/_/
s/" title="Click to read more about /_/
s/">//
p
}')

# Cleaning out the spaces I do not want
pass3=$(echo "$pass2" | sed -ne '/    /{
s/    //
p
}')

# removing the tabs I do not want
pass4=$(echo "$pass3" | perl -p -e 's{\t+}{ }g') 

# output to temp file for record
echo "$pass4" > filtered.txt

# output using awk in the format I want with clean data
gawk -i inplace 'BEGIN { FS = "_"; } {printf "%s%s\n%s\n", $3, $4, $2 } ' filtered.txt

# output all of the headings with line numbers to a file
awk '( NR % 2 == 1 ) {print NR ") " $s} ' filtered.txt > heading.txt

# output all of the URLS with line numbers to a file
awk '( NR % 2 == 0 ) {print ""$s} ' filtered.txt > url.txt

exit 0

#end
