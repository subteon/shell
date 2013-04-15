#!/bin/sh

#--------------------#

# servers_check.sh
# auther : teon

# with files
# -- servers_list.txt
# -- servers_check.log

#-------
# $ sh servers_check.sh servers_list.txt
#-------
# with crontab etc...

#--------------------#

# list read

#text = cat `./servers_list.txt`

alert_log="./server_alert.log"

[ -f $1 ] || exit 1

for i in $(cat $1)
do
  date_str=`date +%F_%T`
  status=`wget -nv --spider --timeout 60 $i 2>&1 | grep -c '200 OK'`

  if [ $status -eq 0 ]
  then
    status_str="alert"
    echo $date_str $i $status $status_str >> $alert_log
  fi

  echo $date_str $i $status $status_str >> server_check.log
  
  sleep 1s
  
done

exit 0

#echo `date +%F_%T`

