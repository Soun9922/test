#!/bin/bash

counter=0
index=0
total_heads=0
total_tails=0
total_firstcombo=0
total_secondcombo=0
total_thirdcombo=0
total_fourthcombo=0


declare -A singlet
singlet[h]=" "
singlet[t]=" "
singlet[h_per]=0
singlet[t_per]=0

declare -A doublet
doublet[first_combo]=" "
doublet[second_combo]=" "
doublet[third_combo]=" "
doublet[fourth_combo]=" "
doublet[first_per]=0
doublet[second_per]=0
doublet[third_per]=0
doublet[fourth_per]=0

read -p "Enter how many times you want to flip : " F
while [ $counter -lt $F ]
do
		coin_1=$((RANDOM%2))
		coin_2=$((RANDOM%2))

		if [ $coin_1 -eq 1 ]
		then
				singlet[h]="H"
				((total_heads++))
				if [ $coin_2 -eq 1 ]
				then
						((total_firstcombo++))
						doublet[first_combo]="HH"
				else
						((total_secondcombo++))
						doublet[second_combo]="HT"
				fi
		else
				singlet[t]="T"
				((total_tails++))
				if [ $coin_2 -eq 1 ]
				then
						((total_thirdcombo++))
						doublet[third_combo]="TH"
				else
						((total_fourthcombo++))
						doublet[fourth_combo]="TT"
				fi
		fi
	((counter++))
done

echo "Combination of Singlet and Doublet"
echo "----------------------------------"
echo "Singlet Combination : " ${singlet[h]}${singlet[t]}
singlet[h_per]=$(echo $total_heads $F | awk '{print $1/$2}')
echo "Percentage of head : "${singlet[h_per]}

singlet[t_per]=$(echo $total_tails $F | awk '{print $1/$2}')
echo "Percentage of tail : "${singlet[t_per]}

echo "-----------------------------------"
echo "Doublet Combination : "${doublet[first_combo]} ${doublet[second_combo]} ${doublet[third_combo]} ${doublet[fourth_combo]}
doublet[first_per]=$(echo $total_firstcombo $F | awk '{print $1/$2}')
echo "Percentage of HH Combination : "${doublet[first_per]}

doublet[first_per]=$(echo $total_firstcombo $F | awk '{print $1/$2}')
echo "Percentage of HT Combination : "${doublet[second_per]}

doublet[first_per]=$(echo $total_firstcombo $F | awk '{print $1/$2}')
echo "Percentage of TH Combination : "${doublet[third_per]}

doublet[first_per]=$(echo $total_firstcombo $F | awk '{print $1/$2}')
echo "Percentage of TT Combination : "${doublet[fourth_per]}


arr[((index++))]=${singlet[h_per]}
arr[((index++))]=${singlet[t_per]}
arr[((index++))]=${doublet[first_per]}
arr[((index++))]=${doublet[second_per]}
arr[((index++))]=${doublet[third_per]}
arr[((index++))]=${doublet[fourth_per]}

echo ${arr[@]}
echo ${#arr[@]}
len=$((${#arr[@]}))
for((i=0;i<5;i++))
do
		for((j=i+1;j<5;j++))
		do
				if [ $((echo "${arr[i]<$arr[j]}")) -eq 1 ]
				then
						temp=${arr[i]}
						arr[i]=${arr[j]}
						arr[j]=$temp
				fi
		done
	done
	echo ${arr[@]}
	max=${arr[0]}

case $max in

		${singlet[h_per]})

		echo "Singlet Combination is Winner"

		;;


		${singlet[t_per]})

		echo "Singlet Combination is Winner"

		;;


		${doublet[first_per]})

		echo "Doublet Combination is Winner"

		;;


		${doublet[second_per]})

		echo "Doublet Combination is Winner"

		;;


		${doublet[third_per]})


		echo "Doublet Combination is Winner"

		;;


		${doublet[third_per]})


		echo "Doublet Combination is Winner"

		;;

	esac

