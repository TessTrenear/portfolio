#!/bin/bash

#Running the 'passwordCheck.sh' script from task 2.4

./passwordCheck.sh 

#If the exit code from passwordCheck.sh is 0, display the following text on the screen: 

if [ $? -eq 0 ];then

while :;
do 

echo -e "\e[1;34m "1. create a folder" \e[0m"
echo -e "\e[1;34m "2. copy a folder" \e[0m"
echo -e "\e[1;34m "3. set a password" \e[0m"
echo -e "\e[1;34m "4. calculator" \e[0m"
echo -e "\e[1;34m "5. create week folders" \e[0m"
echo -e "\e[1;34m "6. check file names" \e[0m"
echo -e "\e[1;34m "7. download a file" \e[0m"
echo -e "\e[1;37m "8. exit" \e[0m"

#The user options listed below link to each of the menu option listed above. For example, menu 1 option links to user option 1. 
# Each time a menu option is executed it executes a script linked to the "megamenu.sh" script

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

4)  

    ./calculator.sh
    ;;

5)  

    ./megafoldermaker.sh 9 11
    ;;

6)  

    ./filenames.sh
    ;;

7)  

    ./downloader.sh
    ;;

8)  

    break;
    ;;

*)

echo "Incorrect selection"
    ;;

esac

done

fi