#!/bin/bash

CUDIR=$(pwd)
CDATE=$(date '+%m-%d-%y')
HWDIR="$CUDIR/Pool_Health_Results/$CDATE"
START=25

mkdir -p $HWDIR

while [ $START -le 30 ]
do

sshpass -p "Password" ssh -o StrictHostKeyChecking=no -o LogLevel=quiet root@10.33.40.$START sh -c "$(cat HW_Test-7.bash)" > "$CUDIR/Pool_Health_Results/$CDATE/HW_Output_$START.txt"
((START++))

done



cat $HWDIR/* >> $HWDIR/HW_Output_All.txt
