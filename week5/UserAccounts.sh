#!/bin/bash
# Purpose: Look at the password file and using awk output a filtered result
# Powers of obsrvation must have been lacking when i tried to place the validation.
# I tried everywhere until i found it in Robs video... advance awk    
# added in additional variable calls to allocate print values in and excluded the columns i did not want
# Author: David Wilkinson
# Created Date Mon Aug 16 17:17:09 AEST 2021

# start #

BLUE='\e[1;34m'
NC='\e[1;0m'

      
echo -e "\n Passwords from the default ETC file are:" 

 
awk 'BEGIN { 
      
    FS=":"; 
# played around with the titles and spacing to make it more consistent      
    print "______________________________________________________________________________________________________"; 
        print "| \033[34mProfile Name     \033[0m | \033[34mUserID  \033[0m | \033[34mGroupID \033[0m | \033[34mHome                           \033[0m | \033[34mShell                 \033[0m |"; 
            print "|___________________|__________|__________|_________________________________|________________________|"; 

} 
 
/.bin.bash/ { 
    printf ("| \033[33m%-17s\033[0m | \033[35m%-8s\033[0m | \033[35m%-8s\033[0m | \033[35m%-31s\033[0m | \033[35m%-22s\033[0m |\n", $1, $3, $4, $6, $7);

} 
      
END { 
      
    print("_____________________________________________________________________________________________________|");
}' /etc/passwd 
     
     

# finish #