#!/bin/bash -x

read -p "Enter the number of flip you want:" num
HHcount=0
TTcount=0
HTcount=0
THcount=0

for (( i=1; i<=$num; i++ ))
do	
	flip=$(($((RANDOM%10))%4))
	if [ $flip -eq 0 ]
	then
		echo "HH"
		HHcount=$(($HHcount+1))
	elif [ $flip -eq 1 ]
	then
		echo "TT"
		TTcount=$(($TTcount+1))
	elif [ $flip -eq 2 ]
	then
		echo "HT"
		HTcount=$(($HTcount+1))
	else
		echo "TH"
		THcount=$(($THcount+1))
	fi
done
echo "number of HH is:"$HHcount
echo "number of TT is::"$TTcount
echo "number of HT is::"$HTcount
echo "number of TH is::"$THcount

percentageOfHH=$(($(($HHcount*100))/$num))
percentageOfTT=$(($(($TTcount*100))/$num))
percentageOfHT=$(($(($HTcount*100))/$num))
percentageOfTH=$(($(($THcount*100))/$num))

echo "HH=$percentageOfHH%"
echo "TT=$percentageOfTT%"
echo "HT=$percentageOfHT%"
echo "TH=$percentageOfTH%"

dict[doublet]="{HH=$HHcount:%=$percentageOfHH TT=$TTcount:%=$percentageOfTT HT=$HTcount:%=$percentageOfHT TH=$THcount:%=$percentageOfTH}"

echo ${dict[@]}
