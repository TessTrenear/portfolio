# !/bin/bash
 
# Take user Input
echo "Enter Two numbers : "
read a
read b
 
# Input type of operation
echo "Enter Choice :"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read ch

# Switch Case to perform
# Calculator operations
case $ch in
  1)
    res=`echo $a + $b | bc`
    echo -e "\e[1;34m $res \e[0m"
  ;;
  2)
    res=`echo $a - $b | bc`
    echo -e "\e[1;32m $res \e[0m"
  ;;
  3)
    res=`echo $a \* $b | bc`
    echo -e "\e[1;31m $res \e[0m"
  ;;
  4)
    res=`echo "scale=2; $a / $b" | bc`
    echo -e "\e[1;35m $res \e[0m"
  ;;
esac
echo "Result : $res"

exit 0