#!/bin/bash
exec >> /home/ognjen/system_stats.log 2>&1
echo 'NEW SCRIPT STARTED'
echo '****************************************************************************************'
echo -e "Date and time:"
date
echo '****************************************************************************************'
echo -e "RAM stats:"
free -h 
echo '****************************************************************************************'
echo -e "Disk space:"
df -h | grep -vE '^(tmpfs|efivarfs)' | awk '{print $1,$2,$4,$5}' | column -t
echo '****************************************************************************************'
echo -e 'UPTIME:'
uptime
echo '****************************************************************************************'
echo -e 'CPU usage:'
top -b -n1 | grep "Cpu(s)" | awk '{print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11}'
echo '****************************************************************************************'
echo -e 'Detils stats:'
vmstat 1 5
echo '****************************************************************************************'
echo -e 'END OF SCRIPT'