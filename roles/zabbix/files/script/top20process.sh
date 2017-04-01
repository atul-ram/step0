ip=`echo "$1"`
toptwnty=`ps -A --sort -rss -o comm,pcpu,pmem |head -n 20`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname`  -k TOPTWENTY  -o "$toptwnty"
