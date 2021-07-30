#!/bin/bash 

# Week 2 script "Create a secret password"

# Create a new folder
    echo "enter folder name"
    read foldername
    
    mkdir $foldername

# Type a secret password (hide password input)
    read -sp 'Enter Password' pass_var

# Create secret.txt file in folder and save secret password in a file called 'secret.txt' inside the new folder 
    echo $pass_var  >./$foldername/secret.txt

    exit 0