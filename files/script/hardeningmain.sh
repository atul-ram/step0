ip=`echo "$1"`
harden=`/bin/sh /etc/zabbix/script/hardening.sh`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname`  -k HARDENDATA -o "$harden"
