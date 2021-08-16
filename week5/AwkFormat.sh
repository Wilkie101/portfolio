#!/bin/bash
# Purpose: To investigate how AWK command works
# Author: Supplied in coursework, spaces removed
# Created Date Mon Aug 16 17:17:09 AEST 2021

# start #

# First line to print
echo -e "\nGoogle Server IPs:"

# Start of Awk
awk 'BEGIN {

# set the value delimeter
    FS=":";
# Print a line
    print "________________________________";

# Headings for the table
    print "| \033[34mServer Type\033[0m | \033[34mIP             \033[0m |";

}

{
# Providing structure to the way vairables % output with spaces #s
    printf("| \033[33m%-11s\033[0m | \033[35m%-15s\033[0m |\n", $1, $2);

}

END {
# last print line after the end of the awk script
    print("________________________________");

# source file
}' input.txt



# finish #
