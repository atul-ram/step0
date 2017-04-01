ip=`echo "$1"`
ualconf=`sudo cat /etc/bashrc |grep substitutions |wc -l`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname` -k UALCONFIG -o "$ualconf"
