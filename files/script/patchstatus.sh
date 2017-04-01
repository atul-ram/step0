ip=`echo "$1"`
sudo cat /var/log/yum.log |awk '{print $1,$2}' |tail -n 60 |sed -n 20p|tr " " __ > /etc/zabbix/script/patchdate_temp
if [ -s /etc/zabbix/script/patchdate_temp ]
then
dat=`date |awk '{print $6}'`
pat=`sudo cat /var/log/yum.log |awk '{print $1,$2}' |tail -n 60 |sed -n 20p|tr " " __`
echo $pat $dat >> /etc/zabbix/script/patchdate
else
echo ""
fi
patchstatus=`sudo cat /etc/zabbix/script/patchdate |tail -n 1`
/usr/local/sbin/zabbix_sender -z $ip -s `hostname`  -k PATCH  -o "$patchstatus"
