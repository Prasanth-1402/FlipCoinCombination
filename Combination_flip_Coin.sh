#!/usr/local/bin/bash

read -p "Enter a Number to limit the Simulation : " input
 
#CONSTANTS
IS_HEAD=1
IS_TAIL=0


declare -A CounterDictionary



function singletGeneration(){

#LOCAL_VARIABLES
count=0
HEADcount=0
TAILcount=0
echo THE GENERATED SINGLE VALUES ARE:

while(($count<$input))
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





function DoubletGeneration(){
#LOCAL_VARIABLES
count=0
HHcount=0
HTcount=0
THcount=0
TTcount=0
echo THE GENERATED VALUES OF DOUBLETS ARE:
while(($count<$input))
do
   one=$((RANDOM%2))
	two=$((RANDOM%2))
   result=$one$two
	echo $result
	case $result in 
	00)
		CounterDictionary[TT]=$((++TTcount))
			;;
	11)
	   CounterDictionary[HH]=$((++HHcount))
			;;
	01)
      CounterDictionary[TH]=$((++THcount))
			;;
	10)
      CounterDictionary[HT]=$((++HTcount))
			;;
	esac
   ((count++))
done

HHpercentage=$(echo "scale = 1; $HHcount/$input*100" | bc)
HTpercentage=$(echo "scale = 1; $HTcount/$input*100" | bc)
THpercentage=$(echo "scale = 1; $THcount/$input*100" | bc)
TTpercentage=$(echo "scale = 1; $TTcount/$input*100" | bc)

echo PERCENTAGE OF VALUES AS FOLLOWS :
echo HH = $HHpercentage%

echo TH = $THpercentage%

echo HT = $HTpercentage%

echo TT = $TTpercentage%

}




singletGeneration


DoubletGeneration



echo HAVE A LOOK OVER THE ENTIRE DICTIONARY  :


for i in ${!CounterDictionary[@]}; do
echo key=$i value=${CounterDictionary[$i]}
done
