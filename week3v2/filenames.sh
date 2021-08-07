#!/bin/bash 

# A looping script that goes through each line of a file. 

myfile="filenames.txt"

    echo "Start!"

IFS=$'\n'

for i in $(cat < "$myfile"); do

    echo "$i"
    echo "Hello"

if [ -d "$i" ]; then

    echo "$i is  directory";

else

if [ -f "$i" ]; then
    
    echo "$i is a file";

else
    
    echo "$i is not valid";

fi

fi

done
