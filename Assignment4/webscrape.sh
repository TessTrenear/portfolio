#!/bin/bash

##################################################
# FUNCTIONS                                      #   
##################################################

function optionOne()
{
    echo -e "\n\e[34m ""1.	In 2020, what were the top five types of identity theft in the USA? \n"" \e[0m"

    sed -n '399,+53p' $1 | sed 's/<[^>]*>//g' | grep -v '^[[:space:]]*$' > tmp.txt #Get row, remove html formatting, remove blank lines.
    sed '2,2d' tmp.txt > temp.txt && cp temp.txt tmp.txt #Remove bank second row.
    awk -v d=":" '{s=(NR==1?s:s d)$0}END{print s}' tmp.txt > temp.txt #join lines and insert : separator for awk statements.
       
    awk -v FS=':' '{printf("|\033[37mRank\033[0m  | \033[37m%-42s\033[0m| \033[37m%-11s\033[0m | \033[37m%-25s\033[0m |\n", $2, $3, $4)}' temp.txt
    awk 'BEGIN { FS=":"; print("|______|___________________________________________|___________________|___________________________|"); }
    {printf("|\033[35m1\033[0m     | \033[35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n", $5, $6, $7)} 
    {printf("|\033[35m2\033[0m     | \033[35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n", $8, $9, $10)}
    {printf("|\033[35m3\033[0m     | \033[35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n", $11, $12, $13)}
    {printf("|\033[35m4\033[0m     | \033[35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n", $14, $15, $16)
    {printf("|\033[35m5\033[0m     | \033[35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n", $17, $18, $19)}
    {printf("|      | \033[1;35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n|______|___________________________________________|___________________|___________________________|\n", $20, $21, $22)} } END {}' temp.txt

    echo -e "\n\e[34m ""2.	In 2020, what was the average number of identity thefts reported? "" \e[0m"

    sed -n '426~5p' facts-statistics-identity-theft-and-cybercrime | sed -n 1,5p | sed 's/<[^>]*>//g'| sed 's/,//g' | grep -v '^[[:space:]]*$' > avgtmp.txt

    values=$(perl -n -a -e '$total += $F[0]; $count++; END { printf "$total:$count" }' avgtmp.txt) # sum up the second column and grab the line count using perl

    IFS=":" read -r sum count <<< "${values}"

    res=`echo "scale=2; $sum / $count" | bc`

    echo -e "        a. \e[32m ""$res "" \e[0m"

    echo -e "\n\e[34m ""3.	Which type of identity theft had the maximum number of reports? \n"" \e[0m"

    awk -v FS=':' '{printf("|\033[37mRank\033[0m  | \033[37m%-42s\033[0m| \033[37m%-11s\033[0m | \033[37m%-25s\033[0m |\n", $2, $3, $4)}' temp.txt
    awk 'BEGIN { FS=":"; print("|______|___________________________________________|___________________|___________________________|"); }
    {printf("|\033[35m1\033[0m     | \033[35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n", $5, $6, $7)
    {printf("|______|___________________________________________|___________________|___________________________|\n")} } END {}' temp.txt

    echo -e "\n\e[34m ""4.	Which type of identity theft had the minimum number of reports? \n"" \e[0m"

    awk -v FS=':' '{printf("|\033[37mRank\033[0m  | \033[37m%-42s\033[0m| \033[37m%-11s\033[0m | \033[37m%-25s\033[0m |\n", $2, $3, $4)}' temp.txt
    awk 'BEGIN { FS=":"; print("|______|___________________________________________|___________________|___________________________|"); }
    {printf("|\033[35m5\033[0m     | \033[35m%-42s\033[0m| \033[31m%+17s\033[0m | \033[31m%+25s\033[0m |\n", $17, $18, $19)
    {printf("|______|___________________________________________|___________________|___________________________|\n\n\n")} } END {}' temp.txt

    rm -f temp.txt tmp.txt avgtmp.txt

}

function optionTwo()
{

    sed -n '527,+257p' $1 | sed 's/<[^>]*>//g' | grep -v '^[[:space:]]*$' > tmp.txt #Get row, remove html formatting, remove blank lines.

    sed 's/,//g' tmp.txt > temp.txt # remove comma

    awk '{ ORS = (NR%4 ? FS : RS) } 1' temp.txt > tmp.txt # put every four lines on the same line.

    awk '{l=$NF;$NF=NF-1;print l,$0}' tmp.txt > temp.txt # move last number to the front of the line

    cp tmp.txt tmpwithcolon.txt

    sed 's/..$//' temp.txt > tmp.txt # remove the last number from the last

    awk '{l=$NF;$NF=NF-1;print l,$0}' tmp.txt > temp.txt # move last number to the front of the line

    sort -n -r -t" " -k1,1 temp.txt > tmp.txt # reverse order sort

    sed 's/..$//' tmp.txt > temp.txt # remove the last number from the last

    cp temp.txt states.txt

    awk '{l=$NF;$NF=NF-1;print l,$0}' states.txt > tempstates.txt # move last number to the front of the line
    sed 's/..$//' tempstates.txt > states.txt # remove the last number from the last

    sed -i 's/\s\+/:/g' states.txt # replace space with colon

    sed -i 's/New.*York/New York/g' states.txt # remove colon from New York
    sed -i 's/New.*Jersey/New Jersey/g' states.txt # remove colon from New Jersey
    sed -i 's/North.*Carolina/North Carolina/g' states.txt # remove colon from North Carolina
    sed -i 's/South.*Carolina/South Carolina/g' states.txt # remove colon from South Carolina
    sed -i 's/Rhode.*Island/Rhode Island/g' states.txt # remove colon from Rhode Island
    sed -i 's/New.*Mexico/New Mexico/g' states.txt # remove colon from New Mexico
    sed -i 's/West.*Virginia/West Virginia/g' states.txt # remove colon West Virginia
    sed -i 's/New.*Hampshire/New Hampshire/g' states.txt # remove colon from New Hampshire
    sed -i 's/Puerto.*Rico/Puerto Rico/g' states.txt # remove colon from Puerto Rico
    sed -i 's/North.*Dakota/North Dakota/g' states.txt # remove colon from North Dakota
    sed -i 's/South.*Dakota/South Dakota/g' states.txt # remove colon from South Dakota

    sort -n -t":" -k3,3 states.txt > statestmp.txt # reverse order sort

    echo -e "\n\e[34m ""1.	How many USA states reported identity theft in 2020? \n"" \e[0m"

    awk 'BEGIN { FS=":"; print "| \033[37mRank\033[0m\t    | \033[37mState\033[0m             | \033[37mReports per 100,000 population\033[0m | \033[37mNumber of Reports\033[0m |\n|___________|___________________|________________________________|___________________|"; }
    {printf("| \033[35m%-10s\033[0m| \033[35m%-18s\033[0m| \033[31m%+30s \033[0m| \033[31m%+17s \033[0m|\n", $3, $4, $1, $2)} END {printf("|___________|___________________|________________________________|___________________|\n")}' statestmp.txt

    sed -e 's/\s\+/:/g' temp.txt > tmp.txt # replace space with colon
   
    grep -n ':' tmp.txt > temp.txt # replace space with colon
  
    sed -n '1,+9p' temp.txt > tmp.txt # get top ten lines

    sed -i 's/New.*York/New York/g' tmp.txt # remove colon from New York

    echo -e "\n\e[34m ""2.	In 2020, what were the top 10 USA states for reporting identity theft? \n"" \e[0m"

    awk 'BEGIN { FS=":"; print "| \033[37mRank\033[0m\t    | \033[37mState\033[0m             | \033[37mNumber of Reports\033[0m |\n|___________|___________________|___________________|"; }
    {printf("| \033[35m%-10s\033[0m| \033[35m%-18s\033[0m| \033[31m%+17s \033[0m|\n", $1, $4, $2)} END {printf("|___________|___________________|___________________|\n")}' tmp.txt

    awk '{l=$NF;$NF=NF-1;print l,$0}' tmpwithcolon.txt > tmp.txt # move last number to the front of the line

    sed 's/..$//' tmp.txt > temp.txt # remove the last number from the last

    awk '{l=$NF;$NF=NF-1;print l,$0}' temp.txt > tmp.txt # move last number to the front of the line

    sed 's/..$//' tmp.txt > temp.txt # remove the last number from the last

    awk '{l=$NF;$NF=NF-1;print l,$0}' temp.txt > tmp.txt # move last number to the front of the line

    sed 's/..$//' tmp.txt > temp.txt # remove the last number from the last

    sort -n -r -t" " -k1,1 temp.txt > tmp.txt # reverse order sort

    echo -e "\n\e[34m ""3.	On average, how many identity thefts were reported in the USA in 2020? "" \e[0m"

    values=$(perl -n -a -e '$total += $F[1]; $count++; END { printf "$total:$count" }' tmp.txt) # sum up the second column and grab the line count using perl
   
    IFS=":" read -r sum count <<< "${values}"

    res=`echo "scale=2; $sum / $count" | bc` #work out the average using bc

    echo -e "        a. \e[32m ""$res "" \e[0m"

    echo -e "\n\e[34m ""4.	Which USA state is ranked number one for identity theft reports per 100,000 population in 2020? \n"" \e[0m"
    
    echo -e "| \033[37m"Rank"\033[0m\t      | \033[37m"State"\033[0m\t      | \033[37m"Reports per 100,000 population"\033[0m | \033[37m"Number of Reports"\033[0m |\n|_____________|_______________|________________________________|___________________|"

    awk 'NR==1{printf("| \033[35m%-10s\033[0m  | \033[35m%-12s\033[0m  | \033[31m%+30s\033[0m | \033[31m%+17s \033[0m|\n|_____________|_______________|________________________________|___________________|\n", $3, $4, $1, $2); exit}' tmp.txt

    echo -e "\n\e[34m ""5.	Which USA state had the minimum number of identity theft reports per 100,000 population in 2020? \n"" \e[0m"

    sort -n -r -t":" -k3,3 states.txt > statestmp.txt # reverse order sort

    echo -e "| \033[37m"Rank"\033[0m\t      | \033[37m"State"\033[0m\t      | \033[37m"Reports per 100,000 population"\033[0m | \033[37m"Number of Reports"\033[0m |\n|_____________|_______________|________________________________|___________________|"

    awk -v FS=':' 'NR==1{printf("| \033[35m%-10s\033[0m  | \033[35m%-10s\033[0m   | \033[31m%+30s\033[0m | \033[31m%+17s \033[0m|\n|_____________|_______________|________________________________|___________________|\n\n\n", $3, $4, $1, $2); exit}' statestmp.txt

    rm -f tmp.txt temp.txt states.txt statestmp.txt tmpwithcolon.txt #remove temporary files

}

function optionThree()
{
    echo -e "\n\e[34m ""1.	In 2020, what were the top 10 USA states for reporting cybercrime losses? \n"" \e[0m"

    #sed -n '527,+257p' facts-statistics-identity-theft-and-cybercrime | sed 's/<[^>]*>//g' | grep -v '^[[:space:]]*$' > tmp.txt #Get row, remove html formatting, remove blank lines.
    sed -n '1087,+89p' $1 | sed 's/<[^>]*>//g' | grep -v '^[[:space:]]*$' > tmp.txt #Get row, remove html formatting, remove blank lines.

    awk '{ ORS = (NR%6 ? FS : RS) } 1' tmp.txt > temp.txt # put every six lines on the same line.

    tr -d '$,' < temp.txt > tmp.txt # remove comma and dollar sign

    sed -e 's/\s\+/:/g' tmp.txt > temp.txt # replace space with colon

    sed -i 's/New.*York/New York/g' temp.txt # remove colon from New York

    sed -i 's/New.*Jersey/New Jersey/g' temp.txt # remove colon from New Jersey

    sed -i 's/(.*millions/(millions/g' temp.txt # remove colon between bracket and millions

    sed -i 's/Losses.*(millions)/Losses ($ millions)/g' temp.txt # remove colon between losses and millions

    awk 'BEGIN { FS=":"; { print "| \033[37mRank\033[0m\t    | \033[37mState\033[0m             | \033[37mLosses ($ millions)\033[0m |\n|___________|___________________|_____________________|"}; }
    (NR>1) { printf("| \033[35m%-10s\033[0m| \033[35m%-18s\033[0m| \033[31m%+19s \033[0m|\n", $4, $5, $6)} END {printf("|___________|___________________|_____________________|\n")}' temp.txt

    echo -e "\n\e[34m ""2.	For the top 10 USA states, what was the average total loss for cybercrime? "" \e[0m"

    sed '1d' temp.txt  > values.txt #remove first line text file as dont want titles.

    awk -F ":" '{print $NF}' values.txt > tmp.txt

    values=$(perl -n -a -e '$total += $F[0]; $count++; END { printf "$total:$count" }' tmp.txt) # sum up the second column and grab the line count using perl

    IFS=":" read -r sum count <<< "${values}"

    res=`echo "scale=2; $sum / $count" | bc` #work out the average using bc

    echo -e "        a. \e[32m ""$ $res million "" \e[0m"

    echo -e "\n\e[34m ""3.	Which USA state loss the maximum amount for cybercrime in 2020? \n"" \e[0m"
    
    awk -F ':' 'NR==1 {printf("| \033[37m%-10s\033[0m  | \033[37m%-30s\033[0m | \033[37m%-19s \033[0m|\n|_____________|________________________________|_____________________|\n", $4, $5, $6); exit}' temp.txt
    awk -F ':' 'NR==2 {printf("| \033[35m%-10s\033[0m  | \033[31m%-30s\033[0m | \033[31m%+19s \033[0m|\n|_____________|________________________________|_____________________|\n", $4, $5, $6); exit}' temp.txt

    echo -e "\n\e[34m ""4.	Which USA state loss the minimum amount for cybercrime in 2020? \n"" \e[0m"

    lines=$(cat temp.txt | wc -l) # get line count

    awk -F ':' 'NR==1 {printf("| \033[37m%-10s\033[0m  | \033[37m%-30s\033[0m | \033[37m%-19s \033[0m|\n|_____________|________________________________|_____________________|\n", $4, $5, $6); exit}' temp.txt
    awk -v count=$lines -F ':' 'NR==count {printf("| \033[35m%-10s\033[0m  | \033[31m%-30s\033[0m | \033[31m%+19s \033[0m|\n|_____________|________________________________|_____________________|\n", $4, $5, $6); exit}' temp.txt

    echo -e "\n\e[34m ""5.	What was the total number of cybercrime victims for the top 10 USA states in 2020? \n"" \e[0m"

    awk 'BEGIN { FS=":"; { print "| \033[37mRank\033[0m\t    | \033[37mState\033[0m                                | \033[37mNumber of cybercrime victims\033[0m |\n|___________|______________________________________|______________________________|"}; }
    (NR>1) { printf("| \033[35m%-10s\033[0m| \033[35m%-37s\033[0m| \033[31m%+28s \033[0m|\n", $1, $2, $3)} 
    END {printf("|___________|______________________________________|______________________________|\n")}' temp.txt

    sed '1d' temp.txt > tmp.txt
    awk -F ':' '{sum+=$3;}END{print "|           | \033[1;35mTotal Number of Cybercrime Victims\033[0m   |                       \033[31m"sum"\033[0m |\n|___________|______________________________________|______________________________|";}' temp.txt

    echo -e "\n\e[34m ""6.	What was the average number of cybercrime victims for the top 10 USA states? "" \e[0m"

    awk -F ':' '{sum+=$3; count++;}END{print "\ta.\033[32m  "sum/count"\033[0m";}' tmp.txt #work out average in Awk

    echo -e "\n\e[34m ""7.	Which USA state had the maximum number of cybercrime victims? \n"" \e[0m"

    awk -F ':' 'NR==1 {printf("| \033[37m%-10s\033[0m  | \033[37m%-30s\033[0m | \033[37m%-1s \033[0mof cybercrime victims |\n|_____________|________________________________|______________________________|\n", $1, $2, $3); exit}' temp.txt
    awk -F ':' 'NR==2 {printf("| \033[35m%-10s\033[0m  | \033[31m%-30s\033[0m | \033[31m%+28s \033[0m|\n|_____________|________________________________|______________________________|\n", $1, $2, $3); exit}' temp.txt

    echo -e "\n\e[34m ""8.	Which USA state had the minimum number of cybercrime victims? \n"" \e[0m"
    
    awk -F ':' 'NR==1 {printf("| \033[37m%-10s\033[0m  | \033[37m%-30s\033[0m | \033[37m%-1s \033[0mof cybercrime victims |\n|_____________|________________________________|______________________________|\n", $1, $2, $3); exit}' temp.txt
    awk -v count=$lines -F ':' 'NR==count {printf("| \033[35m%-10s\033[0m  | \033[31m%-30s\033[0m | \033[31m%+28s \033[0m|\n|_____________|________________________________|______________________________|\n\n\n", $1, $2, $3); exit}' temp.txt

    rm -f tmp.txt temp.txt values.txt #remove temporary files

}

function webScrape()
{
    curl=$(which curl)
    #url="https://www.iii.org/fact-statistic/facts-statistics-identity-theft-and-cybercrime"
    #websitefile="facts-statistics-identity-theft-and-cybercrime"
    
    if [ ! -f $1 ]
    then
        $curl -o $1 $2 &>/dev/null
        #$curl -o $websitefile $url
        [ $? -ne 0 ] && echo "Error: Unable to download page" && return -1
    fi
   
}

function passwordCheck()
{
    
RED='\e[1;31m'

NC1='\e[0m'

printf "${RED}Enter Password:${NC1}";read -s pass_var

# Check the user’s password against the hash stored in 'secret.txt'
var_hash=$( echo $pass_var | sha256sum )

hashfile="secret.txt"

myvariable=$(cat "$hashfile")

# If the user’s password is correct, print “Access Granted” and quit with the return code 0.
# If the user’s password is incorrect print “Access Denied” and quit with the return code 1.

if [ "$var_hash" == "$myvariable" ];
then
        echo -e "\e[1;32m "Access Granted" \e[0m\n"
#exit 0 
return 0

else
        echo " Access Denied"
return 1
#exit 1

fi

}


##################################################
# MAIN                                           #   
##################################################

# Perform the password check before running anything else.

passwordCheck

#If the return code from passwordCheck.sh is 0, display the following text on the screen: 

if [ $? -eq 0 ];then


url="https://www.iii.org/fact-statistic/facts-statistics-identity-theft-and-cybercrime"
websitefile="facts-statistics-identity-theft-and-cybercrime"

webScrape $websitefile $url

while :;
do 

echo -e "\e[1;34m "1.	Top Five Types of Identity Theft [USA, 2020]" \e[0m"
echo -e "\e[1;34m "2.	Identity Theft by State [USA, 2020]" \e[0m"
echo -e "\e[1;34m "3.	Top 10 States by Number of Cybercrime Victims and by Losses [USA, 2020]" \e[0m"

echo -e "\e[1;37m "4.   Exit" \e[0m"

read useroption

case $useroption in

1)

    optionOne $websitefile
    
    ;;

2)

     optionTwo $websitefile
    ;;

3)

    optionThree $websitefile
    ;;

4)  

    break; # Option 4 selected so exit the loop.
    ;;

*)

echo "Incorrect selection"
    ;;

esac

done

fi