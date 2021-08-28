#!/bin/bash -x
read -p "Enter the number of flip you want:" num
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
		echo "HHH"
		HHHcount=$(($HHHcount+1))
	elif [ $flip -eq 1 ]
	then
		echo "TTT"
		TTTcount=$(($TTTcount+1))
	elif [ $flip -eq 2 ]
	then
		echo "HHT"
		HHTcount=$(($HHTcount+1))
	elif [ $flip -eq 3 ]
	then
		echo "THH"
		THHcount=$(($THHcount+1))
	elif [ $flip -eq 4 ]
	then
		echo "TTH"
		TTHcount=$(($TTHcount+1))
	elif [ $flip -eq 5 ]
	then		echo "HTT"
		HTTcount=$(($HTTcount+1))
	elif [ $flip -eq 6 ]
	then
		echo "HTH"
		HTHcount=$(($HTHcount+1))
	else
		echo "THT"
		THTcount=$(($THTcount+1))
	fi
done

echo "number of HHH is::"$HHHcount
echo "number of TTT is::"$TTTcount
echo "number of HHT is::"$HHTcount
echo "number of THH is::"$THHcount
echo "number of TTH is::"$TTHcount
echo "number of HTT is::"$HTTcount
echo "number of HTH is::"$HTHcount
echo "number of THT is::"$THTcount
 
percentageOfHHH=$(($(($HHHcount*100))/$num))
percentageOfTTT=$(($(($TTTcount*100))/$num))		
percentageOfHHT=$(($(($HHTcount*100))/$num))		
percentageOfTHH=$(($(($THHcount*100))/$num))		
percentageOfTTH=$(($(($TTHcount*100))/$num))		
percentageOfHTT=$(($(($HTTcount*100))/$num))		
percentageOfHTH=$(($(($HTHcount*100))/$num))		
percentageOfTHT=$(($(($THTcount*100))/$num)) 		

echo "HHH=$percentageOfHHH%"		
echo "TTT=$percentageOfTTT%"		
echo "HHT=$percentageOfHHT%"		
echo "THH=$percentageOfTHH%"		
echo "TTH=$percentageOfTTH%"		
echo "HTT=$percentageOfHTT%"		
echo "HTH=$percentageOfHTH%"		
echo "THT=$percentageOfTHT%" 		

dict[triplet]="{HHH=$HHHcount:%=$percentageOfHHH TTT=$TTTcount:%=$percentageOfTTT HHT=$HHTcount:%=$percentageOfHHT THH=$THHcount:%=$percentageOfTHH TTH=$TTHcount:%=$percentageOfTTH HTT=$HTTcount:%=$percentageOfHTT HTH=$HTHcount:%=$percentageOfHTH THT=$THTcount:%=$percentageOfTHT }"		

echo ${dict[@]}
