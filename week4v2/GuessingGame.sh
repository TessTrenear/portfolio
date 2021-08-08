#!/bin/bash

#This function prints a given error

printError()

{

    echo -e "\033[31mERROR:\033[0m $1"

}

#This function will get a value between the 2nd and 3rd arguments

getNumber()

{
	while :
	do
		read -p "$1: " response

    		if [[ "$response" -lt "$2" || "$response" -gt "$3" ]]; then
                printError "Input must be between $2 and $3"
			else
               break
            fi
        
	done
}

while :
#while [[ "$response" != "42" ]] #if uncomment this, comment "break" below 

do
    getNumber "Please type a number between 1 and 100" 1 100
   
    if [[ "$response" -eq "42" ]]; then
        echo "Correct"
        break #correct so exit while loop
    elif [[ "$response" -lt "42" ]]; then
        echo "Too low"
    elif [[ "$response" -gt "42" ]]; then
        echo "Too high"
    fi

done