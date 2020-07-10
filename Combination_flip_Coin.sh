#!/usr/local/bin/bash 

read -p "Enter a Number to limit the Simulation : " input
 
#CONSTANTS
IS_HEAD=1
IS_TAIL=0

echo 1s ARE HEAD
echo 0s ARE TAIL

declare -A CounterDictionary

declare -A percentageDictionary

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

percentageDictionary[H]=$Hpercentage
percentageDictionary[T]=$Tpercentage

}

#--------------------------------------------------

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

percentageDictionary[HH]=$HHpercentage
percentageDictionary[TH]=$THpercentage
percentageDictionary[HT]=$HTpercentage
percentageDictionary[TT]=$TTpercentage



}


#--------------------------------------------


function TripletGeneration(){
#LOCAL_VARIABLES
count=0
HHHcount=0
TTTcount=0
HTTcount=0
THHcount=0
HTHcount=0
THTcount=0
TTHcount=0
HHTcount=0
echo THE GENERATED VALUES OF DTRIPLETS ARE:

while(($count<$input))
do
   one=$((RANDOM%2))
   two=$((RANDOM%2))
	three=$((RANDOM%2))
   result=$one$two$three
   echo $result
   case $result in
   000)
      CounterDictionary[TTT]=$((++TTTcount))
      	;;
   111)
      CounterDictionary[HHH]=$((++HHHcount))
         ;;
   100)
      CounterDictionary[HTT]=$((++HTTcount))
         ;;
   001)
      CounterDictionary[TTH]=$((++TTHcount))
         ;;
	010)
		CounterDictionary[THT]=$((++THTcount))
			;;
	101)
      CounterDictionary[HTH]=$((++HTHcount))
         ;;
	011)
      CounterDictionary[THH]=$((++THHcount))
         ;;
	110)
      CounterDictionary[HHT]=$((++HHTcount))
         ;;
   esac
   ((count++))
done

HHHpercentage=$(echo "scale = 1; $HHHcount/$input*100" | bc)
TTTpercentage=$(echo "scale = 1; $TTTcount/$input*100" | bc)
HTTpercentage=$(echo "scale = 1; $HTTcount/$input*100" | bc)
THHpercentage=$(echo "scale = 1; $THHcount/$input*100" | bc)
HTHpercentage=$(echo "scale = 1; $HTHcount/$input*100" | bc)
THTpercentage=$(echo "scale = 1; $HTHcount/$input*100" | bc)
TTHpercentage=$(echo "scale = 1; $TTHcount/$input*100" | bc)
HHTpercentage=$(echo "scale = 1; $HHTcount/$input*100" | bc)


echo HHH  = $HHHpercentage%
echo TTT  = $TTTpercentage%
echo HTT  = $HTTpercentage%
echo THH  = $THHpercentage%
echo HTH  = $HTHpercentage%
echo THT  = $THTpercentage%
echo TTH  = $TTHpercentage%
echo HHT  = $HHTpercentage%


percentageDictionary[HHH]=$HHHpercentage
percentageDictionary[TTT]=$TTTpercentage
percentageDictionary[HTT]=$HTTpercentage
percentageDictionary[THH]=$THHpercentage
percentageDictionary[HTH]=$HTHpercentage
percentageDictionary[THT]=$THTpercentage
percentageDictionary[TTH]=$TTHpercentage
percentageDictionary[HHT]=$HHTpercentage


}

#--------------------------------------

singletGeneration
DoubletGeneration
TripletGeneration


echo HAVE A LOOK OVER THE ENTIRE DICTIONARY  :

for i in ${!percentageDictionary[@]}; do
echo key=$i value=${percentageDictionary[$i]}
done

declare -A SortedDictionary

#echo SORTED DICTIONARY BASED ON VALUES :
#SortedDictionary=$(for k in "${!percentageDictionary[@]}"
#do
#   echo -n $k  HAS  ${percentageDictionary["$k"]} "  "
#	 echo "  "
#done |	sort -nr -k3)





max=0
for i in ${!percentageDictionary[@]}; do
if [[ ${percentageDictionary[$i]}>$max ]]
then
	max=${percentageDictionary[$i]}
fi
done 






for i in ${!percentageDictionary[@]}; do
if [ ${percentageDictionary[$i]} == $max ]
then
  	echo MAX OCCURING VALUE IS $i
fi
done

