#!/bin/bash
# Author: David Wilkinson
# Date:	09/08/2021
# Version: 31:)
# Purpose: Validate the start of my Assessment 4 script. I want to sed out the url's to one file
# and headings to another file so I can build a case statement out of them.

# Start #

# Start with clean files to ensure fresh data

output=~/student/scripts/portfolio/Assessment4/subScripts/output.txt
filtered=~/student/scripts/portfolio/Assessment4/subScripts/filtered.txt
heading=~/student/scripts/portfolio/Assessment4/subScripts/heading.txt
url=~/student/scripts/portfolio/Assessment4/subScripts/url.txt

sed -i d "$output"
sed -i d "$filtered"
sed -i d "$heading"
sed -i d "$url"

# curl the website for the contents of the html
curl -s -o "$output" https://www.cyber.gov.au/acsc/view-all-content/alerts

#set the var for the page
raw_txt="$(cat "$output")"

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
echo "$pass4" > "$filtered"

# output using awk in the format I want with clean data
gawk -i inplace 'BEGIN { FS = "_"; } {printf "%s%s\n%s\n", $3, $4, $2 } ' "$filtered" # (Mandeep_Sheoran. et al. 2019)

# output all of the headings with line numbers to a file
awk '( NR % 2 == 1 ) {print NR ") " $s} ' "$filtered" > "$heading"

# output all of the URLS with line numbers to a file
awk '( NR % 2 == 0 ) {print ""$s} ' "$filtered" > "$url"

exit 0

#end


# REFERENCES
# I learnt more than anything how to trial a sed command before using in a script.
# root, tech. (2019, Jun 22). How to Scrape a Web Page Using Bash Script. youtube.com
# https://www.youtube.com/watch?v=DZ0WKRmUTm4
#
# ManasChhabra2. et al.  (2019, Nov 26). Sed Command in Linux/Unix with examples. geeksforgeeks.org
# https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/
#
# Mandeep_Sheoran. et al. (2019, 06 May). Sed Command in Linux/Unix with examples. geeksforgeeks.org
# https://www.geeksforgeeks.org/gawk-command-in-linux-with-examples/
#
# Fahmida, Y. (2019). 50 `sed` Command Examples. linuxhint.com
# https://linuxhint.com/50_sed_command_examples/


