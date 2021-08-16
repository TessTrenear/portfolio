

#!/usr/bin/python3
import itertools
import string
import hashlib

#Hidden password hash
#A brute force attack instead of a dictionary attack. 
#A brute force attack attempts every possible combination of numbers; and letters until the correct password is guessed instead of using words from a list.
#Run the BruteForce.py script int visual studio code. Press the play button in the top right corner to run the script.

#Change the passwordHash to 'ac' or 'czf' instead of 'hello' to test run the script on a shorter password

#passwordHash = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824" # hello
passwordHash = "f45de51cdef30991551e41e882dd7b5404799648a0a00753f44fc966e6153fc1" # ac New string just for testing
#passwordHash = "7230e59e540a45113fed2b415e6a1941d29e4f7b6658ca0f3887a60ea88b5da9" # czf New string just for testing
bruteHash = ""

for x in itertools.count(): # simple for loop so repeat value changes from 1 to higher in the loop below. (eg, repeat=x ). Used itertools.count(), but could change it to just a loop. https://docs.python.org/3/library/itertools.html#itertools.count

        if(bruteHash == passwordHash):

            break

        for i in itertools.product(string.ascii_letters + string.digits, repeat=x): 
  
            disallowed = str(i) # Covert generated output from itertools.product to a string using str() function  
           
            password = disallowed.translate({ ord(c): None for c in ",'() " }) 

            password = password.rstrip()

            bruteHash = hashlib.sha256(password.encode("utf-8")).hexdigest() # Hash the generated string
          
            print(f"Trying password {password}:{bruteHash}")
           
            # If the hash is the same as the correct password's hash then we have cracked the password!

            if(bruteHash == passwordHash): # Compare the generated string hash with the password hash string provided.

                print(f"Password has been cracked! It was {password}")
                #f.write(f"Password has been cracked! It was {password}\n")
                #f.close() 

                break
