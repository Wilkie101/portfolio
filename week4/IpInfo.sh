#!/bin/bash
# Purpose: This is the script used by Rob to demo sed in 4.5
# Author: David Wilkinson
# Created Date Sat Aug 7 11:45:14 AEST 2021
# Version 1

# start #
      
#get info about networking from the ifconfig command
      
net_info="$(ifconfig)"
      
#parse out the ip address lines using sed
      
addresses=$(echo "$net_info" | sed -n '/inet / {
      
s/inet/IP Address:/
      
s/netmask/\n\t\tSubnet Mask:/
      
s/broadcast/\n\t\tBroadcast Address:/
      
p
      
}')
      
#format output
      
echo -e "IP addresses on this computer are:\n$addresses"
     

# finish #
