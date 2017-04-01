#while true; do
#    echo " "
#    echo " "
#    echo " THIS WILL INSTALL ZABBIX AGENT IN ULTIMATIX PRODUCTION APP ZONE"	
#    echo " "
#    echo " "		
##   read -p "!!!!!Do you wish to proceed with the installation !!!!!!!" yn
#    echo " "
#    case $yn in
#        [Yy]* ) yum install sysstat; break;;
#        [Nn]* ) exit;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done
sed -i 's/Defaults    requiretty/#Defaults    requiretty/' /etc/sudoers
echo "zabbix ALL= NOPASSWD : /usr/bin/tailf, /bin/cat, /bin/grep,/bin/awk, /bin/sed, /usr/local/sbin/zabbix_sender, /usr/bin/tr,  /usr/sbin/dmidecode, /usr/bin/lsattr, /bin/ls" >> /etc/sudoers
useradd -m -c "Zabbix monitoring agent" zabbix
echo -e "z@bb1xhijkill" | passwd --stdin zabbix
mkdir /etc/zabbix
cp -a script /etc/zabbix
cp zabbix_agentd.conf /etc/zabbix
hostnam=`hostname`
echo "Hostname=$hostnam" >> /etc/zabbix/zabbix_agentd.conf
chage -I -1 -m 0 -M 99999 -E -1 zabbix
echo " "
echo " " 
cp -a zabbix* /usr/local/sbin/
touch /usr/local/bin/zabagentstart
touch /usr/local/bin/zabagentstop
cat zabagstrt >> /usr/local/bin/zabagentstart
cat zabagstop >> /usr/local/bin/zabagentstop
#echo "killall -9 zabbix_agentd" > /usr/local/bin/zabagentstop
#echo "echo "Zabbix agent stopped"" >> /usr/local/bin/zabagentstop
#echo "/usr/local/sbin/zabbix_agentd -c /etc/zabbix/zabbix_agentd.conf" > /usr/local/bin/zabagentstart
chmod 755 /usr/local/bin/zabagentstart
chmod 755 /usr/local/bin/zabagentstop
chown -R zabbix /usr/local/bin/zabagentstop
chown -R zabbix /usr/local/bin/zabagentstart
chmod -R 755 /etc/zabbix/script
chown -Rv zabbix:zabbix /etc/zabbix
chmod 755 /usr/local/sbin/zabbix* 
/etc/init.d/sysstat start
chkconfig --level 35 sysstat on
echo "/usr/local/bin/zabagentstart" >> /etc/rc.local
###### Information
/usr/local/sbin/zabbix_agentd -c /etc/zabbix/zabbix_agentd.conf
IPad=`ifconfig  |grep "Bcast" |awk '{print $2}'|cut -d: -f2-`
echo " "
echo " ZABBIX INSTALLATION COMPLETED SUCCESSFULLY "
echo "Please provide the below information to zabbix team"
echo " "
echo "Server IP = $IPad"
echo "Server Hostname = $hostnam"

