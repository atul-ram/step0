ip=`echo "$1"`
ntpdely=`ntpq -p |grep 172.17 |awk '{print $8}' |sed -n 1p`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname`  -k ntpdelay -o "$ntpdely"
