ip=`echo "$1"`
diskutil=`iostat -dkx |awk  '{print $1,$6,$7,$9,$10,$11,$12}'| column -t`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname`  -k DISKIOPS -o "$diskutil"
