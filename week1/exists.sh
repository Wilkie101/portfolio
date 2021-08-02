#!/bin/bash
echo "Enter the file name and extension you would like to search for"
read filename
if [ -f "$filename" ]; then
echo "Your file has been found!"
echo "File path details are:"
readlink -f "$filename"
else
echo "Sorry i cannot find your file"
fi

