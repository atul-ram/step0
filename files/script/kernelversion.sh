ip=`echo "$1"`
kernelv=`uname -a | awk '{print $3}'`
versio=`cat /etc/redhat-release |awk  '{print $1,$2,$7}'`
kernel=`echo $versio /   $kernelv`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname` -k KERNELV -o "$kernel"
