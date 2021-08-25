# !/usr/bin/python3 
# Created: 18/08/2021
# Author: Provided by course work      

# Start

import hashlib
      
# hidden password hash 
      
passwordHash = "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5" 
      
# open the wordlist 
      
with open("lg_word.txt", "r") as wordlist: 
      
    # repeat for each word 
      
    for word in wordlist.readlines(): 
      
        word = word.rstrip() 
      
        # hash the word 
      
        wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest() 
        print("Trying password" ,word ,wordlistHash)



 #       print(f"Trying password {word}:{wordlistHash}") 
      
        # if the hash is the same as the correct password's hash then we have cracked the password! 
      
        if(wordlistHash == passwordHash): 
      
            print("Password has been cracked! It was " ,word) 
      
            break 

# End  