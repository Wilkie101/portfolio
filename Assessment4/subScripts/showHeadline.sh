# !/usr/bin/env bash
# Author: David Wilkinson
# Created: 21/08/2021
# Version 5.0
# Purpose: This is to show the headlines of the Alert Pages

# Start

sed 1,588d output.txt > headline.txt
sed -i 355,519d headline.txt
sed -i 's/<[^>]*>//g' headline.txt
sed -i 354,363d headline.txt
fold -w 120 -s headline.txt | less #(Bendig, 2011)

#finish

# REFERENCES:

# Bendig, R. 23/Nov/2011. How can I wrap text at a certain column size? https://unix.stackexchange.com/
# https://unix.stackexchange.com/questions/25173/how-can-i-wrap-text-at-a-certain-column-size