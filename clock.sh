#! /bin/bash

filename="timecard.log"

print_usage() {
	echo -e "Pass 1 argument to log an activity for the current time to ${filename}.\n"
	echo -e "\t ./clock.sh \"Project X\"\n"
	echo -e "Pass 2 arguments to log an activity for a time offset to ${filename}.\n"
	echo -e "\t ./clock.sh \"Project X\" \"-2days-3hours-24min-41sec\"\n"
}

if [ "$#" -eq 1 ]; then
    echo "[$(TZ=America/Chicago date)] --- ${1}" >> "${filename}"
elif [ "$#" -eq 2 ]; then
    echo "[$(TZ=America/Chicago date -d ${2})] --- ${1}" >> "${filename}"
else
    print_usage
fi