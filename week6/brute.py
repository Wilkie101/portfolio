# !/usr/bin/python3 

import random
import string
import time
import hashlib

start = time.time()

counter = 1
CharLength = 1

char = "abcdefghijklmnopqrstuvwxyz"


# chars = string.printable
charList = list(char)

passHash = "8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52"
wordHash = "" 
ranPass = ""

# Function to convert character list to a string
def listToString (s):
    str1=""
    for ele in s:
            str1 += ele
    return str1


while(wordHash != passHash):
        ranPass = random.choices(char, k=4)
#        print(listToString(ranPass)) not needed as it is printed in the 1 line below
        word=listToString(ranPass)
        word=word.rstrip()
        wordHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
        print("<======>"+ word + "<======>"+ wordHash )
#        print("this is wordHash :", wordHash) # testing the functions of the hash
#        print("this is passHash :" ,passHash) # testing the functions of the hash
#        print("this is ranPass :" ,ranPass) # testing the functions of the hash
#        print("this is the last :" ,word) # testing the functions of the hash
        counter += 1

        if(wordHash == passHash):
            end = time.time()
            timetaken = end - start
            print("Your password is : "+ "".join(ranPass))
            print("Found it in ", timetaken, " seconds and ", counter, "attempts")
            break