#!/bin/bash
 
#CONSTANTS
IS_HEAD=1
IS_TAILS=0

result=$((RANDOM%2))

if [[ $result -eq $IS_HEAD ]]
then
	echo HEAD
else
	echo TAIL
fi
