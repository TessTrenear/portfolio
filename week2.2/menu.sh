#!/bin/bash

#Running the 'passwordCheck.sh' script from task 2.4

./passwordCheck.sh 

#If the exit code from passwordCheck.sh is 0, display the following text on the screen: 

if [ $? -eq 0 ]; then 
    echo "1. create a folder" 
    echo "2. copy a folder"
    echo "3. set a password"

else 
    echo "goodbye"

exit 1

fi

read useroption

case $useroption in

1)

    ./foldermaker.sh
    ;;

2)

    ./foldercopier.sh
    ;;

3)

    ./setPassword.sh
    ;;

*)

echo "Incorrect selection"
    ;;

esac

exit 0