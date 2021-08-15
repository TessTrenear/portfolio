#!/bin/bash
# UserAccounts.sh

# PART A
# Format “/etc/passwd” file into a neat table  
awk 'BEGIN { FS=":"; print "| \033[1;34mUsername\033[0m\t      | \033[1;34mUserID\033[0m | \033[1;34mGroupID\033[0m | \033[1;34mHome\033[0m\t\t\t              | \033[1;34mShell\033[0m\t\t  |\n|_____________________|________|_________|____________________________________|___________________|"; }
{printf("| \033[1;32m%-20s\033[0m| %-7s| %-8s| %-35s| %-18s|\n", $1, $3, $4, $6, $7)} END {}' /etc/passwd
# Line 6: Prints out the first two lines of the table.
# Line 7: Next lines grab the info from /etc/password.  

echo "" #separate it for readability.

# PART B
# Use Regex to make the  “UserAccounts.sh” awk script filter the data to only show users who have “/bin/bash” listed as their default shell.
awk 'BEGIN { print "| \033[1;34mUsername\033[0m\t      | \033[1;34mUserID\033[0m | \033[1;34mGroupID\033[0m | \033[1;34mHome\033[0m\t\t\t              | \033[1;34mShell\033[0m\t\t  |\n|_____________________|________|_________|____________________________________|___________________|" }'
awk -v FS=":" '/bin\/bash/{ printf("| \033[1;35m%-20s\033[0m| %-7s| %-8s| %-35s| %-18s|\n", $1, $3, $4, $6, $7) }' /etc/passwd
# Line 15: 1st awk command prints out the first two lines of the table.
# Line 16: 2nd awk command, is similar to Line 6, except filters it on /bin/bash using "/bin\/bash/" regex. 