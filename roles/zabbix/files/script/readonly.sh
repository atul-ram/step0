ip=`echo "$1"`
readonly=`sudo cat /proc/mounts |grep -i ro, |wc -l`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname` -k READONLY -o "$readonly"
