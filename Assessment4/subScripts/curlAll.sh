#!/bin/bash
#Author: David Wilkinson
#Date:	20/08/2021
#Version: 1

# start

# Defining all of the colours
BLUE='\e[1;34m'
NC='\e[1;0m'

# Error Handling
printError() {
    echo -e "\033[31mERROR:\033[0m $1"
}

page=~/student/scripts/portfolio/Assessment4/subScripts/page.txt
allpages=~/student/scripts/portfolio/Assessment4/allpages.txt
url=~/student/scripts/portfolio/Assessment4/subScripts/url.txt
topurl=~/student/scripts/portfolio/Assessment4/subScripts/topurl.txt

# Resetting the txt files so there is no impact from dirty data
sed -i d "$topurl"
sed -i d "$page"
sed -i d "$allpages"

# Prompt the user for the number of files they would like to download 
echo -e "${BLUE}\n"
read -p "Enter a number between 1-50 for the number of alert pages would you like to download to file?" num # (Shellabarger, 2019)
    while (( "$num" < "1" || "$num" > "51" )); do
            printError "  Entry must be a number less than 50: "
            read -p "         Please retry with a valid selection:" num
    done

echo -e "${NC}"
# This takes the number of URL's prompted by the user and passes it to a working file
head -n ${num} "$url" > "$topurl"

sed -i 's|^|https://www.cyber.gov.au/acsc/view-all-content/alerts/|' "$topurl"

# Loop through the curl of the pages and clean the data 
for i in $(cat "$topurl"); do 
    echo "Getting data from: "$i" "
    curl ${i} > "$page" && # (Shallabarger, 2018)
    sleep .5
    sed -i 1,592d "$page" # (Zhang, 2018)
    sed -i 16,400d "$page"
    sed -i 's:<p>:\n<p>:g' "$page"
    sed -i 's/<[^>]*>//g' "$page"
    perl -pi -e 's{\t+}{ }g' "$page"
    sed -i 's|^[[:blank:]]*||1' "$page"
    fold -w 120 -s "$page" >> "$allpages"
    echo -e "\n\n**********************************************************************************" >> "$allpages"
done
less "$allpages"
echo "Your file allpage.txt is ready to read"

exit 0

# Shellabarger, N. (2019). Bash read command.linuxhint.com
# https://linuxhint.com/bash_read_command/
#
# Devhints below is my default cheat sheet as it is clear and concise
# @rstacruz. (2021). Bash scripting cheatsheet. Devhints.io
# https://devhints.io/bash
# 
# Jasonw. (2019, Jan). Bash - Curl (6) couldn't resolve host issue. stackoverflow.com
# https://stackoverflow.com/questions/8922061/bash-curl-6-couldnt-resolve-host-issue
#
# Shellabarger, N. (2018). Curl in Bash Scripts by Example. LinuxHint.com
# https://linuxhint.com/curl_bash_examples/
#
# Zhang, Denny. (2018, Dec 30). Sed & Regexp Cheatsheet. cheatsheet.dennyzhang.com
# https://cheatsheet.dennyzhang.com/cheatsheet-sed-a4