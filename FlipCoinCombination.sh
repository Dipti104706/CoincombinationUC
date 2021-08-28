#!/bin/bash -x

declare -A dict

read -p "Enter the number of flip you want:" num
headsCount=0
tailsCount=0

for (( i=1; i<=$num; i++ ))
do
	flip=$(($((RANDOM%10))%2))
	if [ $flip -eq 0 ]
	then
		headsCount=$(($headsCount+1))
	else
		tailsCount=$(($tailsCount+1))
	fi
done

dict["percentageOfHeads"]="$(($(($headsCount*100))/$num))"
dict["percentageOfTails"]="$(($(($tailsCount*100))/$num))"
HHcount=0
TTcount=0
HTcount=0
THcount=0

for (( i=1; i<=$num; i++ ))
do
	flip=$(($((RANDOM%10))%4))
	if [ $flip -eq 0 ]	
	then
		HHcount=$(($HHcount+1))
	elif [ $flip -eq 1 ]	
	then
		TTcount=$(($TTcount+1))
	elif [ $flip -eq 2 ]
	then
		HTcount=$(($HTcount+1))
	else
		THcount=$(($THcount+1))
	fi
done

dict["percentageOfHH"]="$(($(($HHcount*100))/$num))"
dict["percentageOfTT"]="$(($(($TTcount*100))/$num))"		
dict["percentageOfHT"]="$(($(($HTcount*100))/$num))"		
dict["percentageOfTH"]="$(($(($THcount*100))/$num))" 
HHHcount=0
TTTcount=0
HHTcount=0
THHcount=0
TTHcount=0
HTTcount=0
HTHcount=0
THTcount=0

for (( i=1; i<=$num; i++ ))
do
	flip=$(($((RANDOM%10))%8))
	if [ $flip -eq 0 ]
	then
		HHHcount=$(($HHHcount+1))
	elif [ $flip -eq 1 ]
	then
		TTTcount=$(($TTTcount+1))
	elif [ $flip -eq 2 ]
	then
		HHTcount=$(($HHTcount+1))
	elif [ $flip -eq 3 ]
	then
		THHcount=$(($THHcount+1))
	elif [ $flip -eq 4 ]
	then
		TTHcount=$(($TTHcount+1))
	elif [ $flip -eq 5 ]
	then
		HTTcount=$(($HTTcount+1))
	elif [ $flip -eq 6 ]
	then
		HTHcount=$(($HTHcount+1))
	else
		THTcount=$(($THTcount+1))
	fi
done

dict["percentageOfHHH"]="$(($(($HHHcount*100))/$num))"
dict["percentageOfTTT"]="$(($(($TTTcount*100))/$num))"		
dict["percentageOfHHT"]="$(($(($HHTcount*100))/$num))"		
dict["percentageOfTHH"]="$(($(($THHcount*100))/$num))"		
dict["percentageOfTTH"]="$(($(($TTHcount*100))/$num))"		
dict["percentageOfHTT"]="$(($(($HTTcount*100))/$num))"		
dict["percentageOfHTH"]="$(($(($HTHcount*100))/$num))"		
dict["percentageOfTHT"]="$(($(($THTcount*100))/$num))"

function sort1() {
	val=("$@")
	array=();
		for values in "${val[@]}"
		do	
			array+=("${values[@]}")
		done
 		for (( i=0; i<${#array[@]}; i++ ))	
		do
			for (( j=$i; j<${#array[@]}; j++ ))
			do
				if [ ${array[$i]} -gt ${array[$j]} ]
				then
					temp=${array[$i]}
					array[$i]=${array[$j]}
					array[$j]=$temp
				fi
			done
		done
	echo ${array[@]}
	max=0
	for (( i=0; i<${#array[@]}; i++ ))
	do
		if [ ${array[$i]} -gt $max ]
		then
			max=${array[$i]};
		fi
	done
	echo "winning combo is::"$max
} 	

echo $(sort1 "${dict[@]}")
