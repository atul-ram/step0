### Set HOST DENY Permission ###
chattr -i /etc/hosts.deny
chmod 600 /etc/hosts.deny
chattr +i /etc/hosts.deny
### Set HOST ALLOW Permission ###
chattr -i /etc/hosts.allow
chmod 600 /etc/hosts.allow
chattr +i /etc/hosts.allow
### ROOT Directory Permission ###
chmod 700 /root/
### SYSCTL Permission ###
chattr -i /etc/sysctl.conf
chmod 600 /etc/sysctl.conf
chattr +i /etc/sysctl.conf
### SYSCTL Attribute Permission ###
chattr +i /etc/sysctl.conf

