#!/bin/bash
threshold=90
disk_usage=$(df --output=pcent | awk 'NR==2')
if [ "$disk_usage" -gt "$threshold%" ]; then
    echo " Disk usage is above the threshold! Current usage: $disk_usage "
else
    echo " Disk usage is within the threshold. Current usage: $disk_usage "
fi
