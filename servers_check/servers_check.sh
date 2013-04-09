#!/bin/sh

#--------------------#

# servers_check.sh
# auther : teon

#-------
# $ sh servers_check.sh servers_list.txt
#-------
# with crontab etc...

#--------------------#

# list read

#text = cat `./servers_list.txt`

[ -f $1 ] || exit 1

for i in $(cat $1)
do
  echo $i
  wget -nv --spider --timeout 60 $i 2>&1 | grep -c '200 OK'
done

exit 0

#echo `date +%F_%T`

