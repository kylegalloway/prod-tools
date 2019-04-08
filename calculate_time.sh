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

calculate_total $1 $2