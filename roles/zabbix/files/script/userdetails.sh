ip=`echo "$1"`
userdetail=`cat /etc/passwd |grep -v "#"|grep  home |awk -F: '{print $1,$5}'`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname` -k USERDETAILS -o "$userdetail"
