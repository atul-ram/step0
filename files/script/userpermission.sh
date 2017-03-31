ip=`echo "$1"`
for i in `cat /etc/passwd |grep home |awk -F : '{print $3}'`
do
if [ `echo $i` -eq 0 ]; then
userpermstatus=`echo "PROBLEM"`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname` -k USERPERM -o "$userpermstatus"
fi
done
