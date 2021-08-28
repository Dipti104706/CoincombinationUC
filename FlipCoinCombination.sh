#!/bin/bash -x

read -p "Enter the number of flip you want:" num
headsCount=0
tailsCount=0

for (( i=1; i<=$num; i++ ))
do	
	flip=$(($((RANDOM%10))%2))
	if [ $flip -eq 0 ]
	then
		echo "Heads"
		headsCount=$(($headsCount+1))
	else
		echo "Tails"
		tailsCount=$(($tailsCount+1))
	fi
done
echo "numbers of head is:"$headsCount
echo "number of tail is::" $tailsCount

percentageOfHeads=$(($(($headsCount*100))/$num))
percentageOfTails=$(($(($tailsCount*100))/$num))

echo "Heads=$percentageOfHeads%"
echo "Tails=$percentageOfTails%"

dict[singlet]="{Heads=$headsCount:percentage=$percentageOfHeadsTails=$tailsCount:percentage=$percentageOfTails}"
echo ${dict[@]}
