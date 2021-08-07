# Week 2 script "passwordCheck.sh"

# Type a secret password (hide password input)

#!/bin/bash

RED='\e[1;31m'

NC1='\e[0m'

printf "${RED}Enter Password:${NC1}";read -s pass_var

# Check the user’s password against the hash stored in 'secret.txt'
var_hash=$( echo $pass_var | sha256sum )

hashfile="secret.txt"

myvariable=$(cat "$hashfile")
    
echo "1: $var_hash"
echo "2. $myvariable"

# If the user’s password is correct, print “Access Granted” and quit with the exit code 0.
# If the user’s password is incorrect print “Access Denied” and quit with the exit code 1.

if [ "$var_hash" == "$myvariable" ];
then
        echo -e "\e[1;32m "Access Granted" \e[0m"
exit 0 

else
        echo "Access Denied"
exit 1

fi
