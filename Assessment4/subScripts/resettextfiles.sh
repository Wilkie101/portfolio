#!/bin/bash
# Purpose: To clear all the text files, helps with testing to make sure it is a clean slate.
# Author: David Wilkinson
# Created Date Sat Aug 21 18:02:36 AEST 2021

sed -i d filtered.txt
sed -i d output.txt
sed -i d page.txt
sed -i d allpage.txt
sed -i d topurl.txt
sed -i d url.txt
sed -i d page.txt
sed -i d allpage.txt
sed -i d heading.txt

echo "all files cleaned"

exit 0
