#!/bin/bash
# Purpose: To Demonstarte our understanding of sed
# This should only display IP Address information
# Author: David Wilkinson
# Created Date Sat Aug 7 11:49:32 AEST 2021
# Version: 1

# start #

# create a new var and place the output from IpInfo into it.
ipinfo="$(./IpInfo.sh)"

# use sed to remove additional lines
# create a new var=echo old var | sed identifier with do not print
ipadd=$(echo "$ipinfo" | sed -n '/IP Address:/{

# sed replacement does not need to be extensive, a single character is enough
s/IP Address/IP_Address/

# print the changed text only
p

}')
# print the output of our sed command
echo "$ipadd"


# finish #
