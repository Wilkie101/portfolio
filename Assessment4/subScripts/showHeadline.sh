# !/usr/bin/env bash
# Author: David Wilkinson
# Created: 21/08/2021
# Version 5.0
# Purpose: This is to show the headlines of the Alert Pages

# Start

output=~/student/scripts/portfolio/Assessment4/subScripts/output.txt
headline=~/student/scripts/portfolio/Assessment4/subScripts/headline.txt
url=~/student/scripts/portfolio/Assessment4/subScripts/url.txt

> "$headline"

sed 1,588d $output > "$headline"
sed -i 355,519d "$headline"
sed -i 's/<[^>]*>//g' "$headline"
sed -i 354,363d "$headline" # (ManasChhabra2)
fold -w 120 -s "$headline" | less #(Bendig, 2011)

#finish

# REFERENCES:

# Bendig, R. (2011, Nov 23). How can I wrap text at a certain column size? https://unix.stackexchange.com/
# https://unix.stackexchange.com/questions/25173/how-can-i-wrap-text-at-a-certain-column-size
#
# ManasChhabra2. et al (2019, Nov 26). Sed Command in Linux/Unix with examples. geeksforgeeks.org
# https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/
#
# Zhang, Denny. (2018, Dec 30). Sed & Regexp Cheatsheet. cheatsheet.dennyzhang.com
# https://cheatsheet.dennyzhang.com/cheatsheet-sed-a4