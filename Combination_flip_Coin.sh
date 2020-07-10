#!/usr/local/bin/bash
 
#CONSTANTS
IS_HEAD=1
IS_TAILS=0

read -p "Enter a Number to limit the Simulation : " input 

function singletGeneration(){

#LOCAL_VARIABLES
count=0
HEADcount=0
TAILcount=0
echo THE GENERATED SINGLE VALUES ARE:

while (($count<$input))
do
   result=$((RANDOM%2))
   echo $result
   if [[ $result -eq $IS_HEAD ]]
   then
      CounterDictionary[H]=$((++HEADcount))
   else
      CounterDictionary[T]=$((++TAILcount))
   fi
   ((count++))
done


Hpercentage=$(echo "scale = 1; $HEADcount/$input*100" | bc)

Tpercentage=$(echo "scale = 1; $TAILcount/$input*100" | bc)

echo PERCENTAGE OF VALUES AS FOLLOWS :
echo H = $Hpercentage%
echo T = $Tpercentage%
}

singletGeneration
