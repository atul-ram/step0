while true; do
    echo " "
    echo " "
    echo " THIS WILL UNINSTALL ZABBIX AGENT"
    echo " "
    echo " "
    read -p "!!!!!Do you wish to proceed with uninstallation y/n!!!!!!!" yn
    echo " "
    case $yn in
        [Yy]* ) echo "Proceeding with uninstallation"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
killall -9 zabbix_agentd
echo "All zabbix process killed"
rm -rf /etc/zabbix
userdel -r zabbix
rm -rf /usr/local/bin/zab*
rm -rf /usr/local/sbin/zab*
sed -i '/zabagentstart/d' /etc/rc.local
echo "Uninstallation completed successfully"
