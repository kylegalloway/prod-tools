#! /bin/bash

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}

calculate_total() {
    local start=$(echo $1 | grep -o '[0-2][0-9]:[0-5][0-9]')
    local end=$(echo $2 | grep -o '[0-2][0-9]:[0-5][0-9]')
    local start_date=$(date +%s -d "$start")
    local end_date=$(date +%s -d "$end")
    local total=$(bc -l <<< "($end_date - $start_date)")
    echo "Total Time: $(convertsecs total)"
}

print_usage() {
	echo -e "Pass 1 argument for the time difference between that argument and now.\n"
	echo -e "\t ./calculate_time_diff.sh 09:45 \n"
	echo -e "Pass 2 arguments for the time difference between the 1st and 2nd argument.\n"
	echo -e "\t ./calculate_time_diff.sh 09:45 10:23\n"
}

if [ "$#" -eq 1 ]; then
    calculate_total $1 $(TZ=America/Chicago date | grep -o '[0-2][0-9]:[0-5][0-9]')
elif [ "$#" -eq 2 ]; then
    calculate_total $1 $2
else
    print_usage
fi