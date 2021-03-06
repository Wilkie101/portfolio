# !/usr/bin/ruby 
# Author: Content provided in course work
# Created 18/08/2021 8pm



       require 'digest' 
      
       #read the password hash 
    
       passwordHash = "61ea0803f8853523b777d414ace3130cd4d3f92de2cd7ff8695c337d79c2eeee" 
             
       #open the wordlist and repeat for each word 
             
       IO.foreach("lg_word.txt") do | word | 
             
           word.chomp! 
             
           #hash the word 
             
           wordlistHash = Digest::SHA256.hexdigest(word) 
             
           puts("Trying password #{word}: #{wordlistHash}") 
             
           #if the hash is the same as the correct password's hash then we have cracked the password! 
             
           if(wordlistHash == passwordHash) 
             
               puts("Password has been cracked! It was #{word}") 
             
               return 
             
           end 
             
       end 
            