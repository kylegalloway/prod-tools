#! /bin/bash

filename="timecard.log"

echo "[$(TZ=America/Chicago date)] --- ${1}" >> "${filename}"
