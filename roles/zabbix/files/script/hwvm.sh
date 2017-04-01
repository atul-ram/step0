ip=`echo "$1"`
hwvmstatus=`dmesg |grep -i vmware |sed -n 1p |wc -l`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname`  -k hwvm -o "$hwvmstatus"
