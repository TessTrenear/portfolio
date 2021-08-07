#!/bin/bash 

# Week 2 script "passwordCheck.sh"

# Type a secret password (hide password input)
read -sp 'Enter Password' pass_var

# Check the user’s password against the hash stored in 'secret.txt'
var_hash=$(echo $var_spass | sha256sum)

hashfile="secret.txt"

myvariable=$(cat "$hashfile")
    
# If the user’s password is correct, print “Access Granted” and quit with the exit code 0.
# If the user’s password is incorrect print “Access Denied” and quit with the exit code 1.

if ["$var_hash" == "$myvariable"]
then
        echo "Access Granted"
exit 0 

else
        echo "Access Denied"
exit 1

fi