#!/bin/bash
sync
echo 3 > /proc/sys/vm/drop_caches
partition=`cat /proc/swaps | tail -n 1 | awk '{print $1}'`
echo "Cleaning partition $partition"
swapoff $partition && swapon $partition
