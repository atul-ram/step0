###### Maximum password Days ##################
maxdayspass=`cat /etc/login.defs |grep "PASS_MAX_DAYS 30" |wc -l`
if [ $maxdayspass == 1 ] ; then
echo "PASSWORD Max days is OK"
else
echo "PASSWORD Max days PROBLEM" 
fi
###### Minimum Password days #################
mindayspass=`cat /etc/login.defs |grep "PASS_MIN_DAYS  1" |wc -l`
if [ $mindayspass == 1 ] ; then
echo "PASSWORD Min days is OK"
else
echo "PASSWORD Min days PROBLEMK"
fi
##### Minimum password length ###############
minpasslength=`cat /etc/login.defs |grep "PASS_MIN_LEN   14" |wc -l`
if [ $minpasslength == 1 ] ; then
echo "PASSWORD Min Length is OK"
else
echo "PASSWORD Min Length PROBLEM"
fi
##### Password warning days ################
passwarndate=`cat /etc/login.defs |grep "PASS_WARN_AGE  7" | wc -l`
if [ $passwarndate == 1 ] ; then
echo "PASSWORD warn date is OK"
else
echo "PASSWORD warn date PROBLEM"
fi
###### PASSWORD EXPIRY Days "
pwdexpiry=`sudo cat /etc/default/useradd |grep EXPIRE=30 |wc -l`
if [ $pwdexpiry == 1 ] ; then
echo "PASSWORD Expiry date is OK"
else
echo "PASSWORD Expiry date PROBLEM"
fi
#### Server run level #####################
srvrrunlevel=`cat /etc/inittab |grep "id:3" |wc -l`
if [ $srvrrunlevel == 1 ] ; then
echo "SERVER run level is OK"
else
echo "SERVER run level PROBLEM"
fi
#### SELinux Status #######################
selinuxstatus=`getenforce |grep -i enf |wc -l`
if [ $selinuxstatus == 1 ] ; then
echo "SELINUX in enforcing mode OK"
else
echo "SELINUX in enforcing mode PROBLEM"
fi
#### Password algorithm ##################
shaalgo=`cat /etc/login.defs |grep "SHA256" |wc -l`
if [ $shaalgo == 1 ] ; then
echo "SHA256 password algorithm OK"
else
echo "SHA256 password algorithm PROBLEM"
fi
###### SYSCTL Permission ###############
sysctlperm=`ls -l /etc/sysctl.conf | awk '{print $1}' |grep "rw-------" |wc -l`
if [ $sysctlperm == 1 ] ; then
echo "SYSCTL permission is OK"
else
echo "SYSCTL permission PROBLEM"
fi
##### Sysctl attribute
sysctlatr=`sudo lsattr  /etc/sysctl.conf |grep "i--------e" |wc -l`
if [ $sysctlatr == 1 ] ; then
echo "SYSCTL attribute permission OK"
else
echo "SYSCTL attribute permission PROBLEM"
fi
##### NTP Configureation status #########
ntpconf=`cat /etc/ntp.conf |grep 172.17. |wc -l`
if [ $ntpconf == 2 ] ; then
echo "NTP Configuration  OK"
else
echo "NTP Configuration PROBLEM"
fi
#####  Root dir permission ##############
rootdir=`sudo ls -l -ld /root/ |grep drwx------ |wc -l`
if [ $rootdir == 1 ] ; then
echo "ROOT dir permission is OK"
else
echo "ROOT dir permission PROBLEM"
fi
##### Banner configuration ##############
bannerstat=` cat /etc/issue |grep time.Unauthorized |wc -l`
if [ $bannerstat == 1 ] ; then
echo "TCS Banner OK"
else
echo "TCS Banner PROBLEM"
fi
###### Host .Allow permission ###########
hostallow=`ls -l /etc/hosts.allow |grep rw------- |wc -l`
if [ $hostallow == 1 ] ; then
echo "HOST ALLOW permission OK"
else
echo "Host ALLOW permission PROBLEM"
fi
##### HOST ALLOW ATTRIBUTES ############
hostallowatr=`sudo lsattr  /etc/hosts.allow |grep "i--------e" |wc -l`
if [ $hostallowatr == 1 ] ; then
echo "HOST ALLOW attribute permission OK"
else
echo "HOST ALLOW attribute permission PROBLEM"
fi
##### HOST DENY PERMISSION ##############
hostdeny=`ls -l /etc/hosts.deny |grep rw------- |wc -l`
if [ $hostdeny == 1 ] ; then
echo "HOST DENY permission OK"
else
echo "HOST DENY permission PROBLEM"
fi
#####
hostsdenyatr=`sudo lsattr  /etc/hosts.deny |grep "i--------e" |wc -l`
if [ $hostsdenyatr == 1 ] ; then
echo "HOST DENY attribute permission OK"
else
echo "HOST DENY attribute permission PROBLEM"
fi
#####NET IPV4 ICMP########################
netipv4ignore=`sudo cat /etc/sysctl.conf |grep "net.ipv4.icmp_ignore_bogus_error_responses = 1" |wc -l`
if [ $netipv4ignore == 1 ] ; then
echo "KERNEL bogus_error OK"
else
echo "KERNEL bogus_error PROBLEM"
fi
#####net.ipv4.conf.all.log_martians########################
netipmartians=`sudo cat /etc/sysctl.conf |grep "net.ipv4.conf.all.log_martians = 1" |wc -l`
if [ $netipv4ignore == 1 ] ; then
echo "KERNEL Martians OK"
else
echo "KERNEL Martians PROBLEM"
fi
#####net.ipv4.icmp_echo_ignore_broadcasts = 1 ########
netbroadcasts=`sudo cat /etc/sysctl.conf |grep "net.ipv4.icmp_echo_ignore_broadcasts = 1" |wc -l`
if [ $netbroadcasts == 1 ] ; then
echo "KERNEL broadcasts OK"
else
echo "KERNEL broadcasts PROBLEM"
fi
######
historyformat=`cat /etc/profile |grep -i HISTTIMEFORMAT |wc -l`
if [ $historyformat == 1 ] ; then
echo "HISTORY FORMAT OK"
else
echo "HISTORY FORMAT PROBLEM"
fi
####
userprivilegesep=`sudo cat /etc/ssh/sshd_config  |grep -i "UsePrivilegeSeparation yes" |grep -v '#' |wc -l`
if [ $userprivilegesep == 1 ] ; then
echo "SSHD User Privilege Seperation OK"
else
echo "SSHD User Privilege Seperation PROBLEM"
fi
####AllowTcpForwarding no ####
tcpforwarding=`sudo cat /etc/ssh/sshd_config  |grep -i "AllowTcpForwarding no" |grep -v '#' |wc -l`
if [ $tcpforwarding == 1 ] ; then
echo "SSHD TCP forwarding OK"
else
echo "SSHD TCP forwarding PROBLEM"
fi
##### X11Forwarding #####
x11forwarding=`sudo cat /etc/ssh/sshd_config  |grep -i "X11Forwarding no" |grep -v '#' |wc -l`
if [ $x11forwarding == 1 ] ; then
echo "SSHD X11 Forwarding OK"
else
echo "SSHD X11 Forwarding PROBLEM"
fi
##### Protocol 2
protocol2=`sudo cat /etc/ssh/sshd_config  |grep -i "Protocol 2" |grep -v '#' |wc -l`
if [ $protocol2 == 1 ] ; then
echo "SSHD Protocol OK"
else
echo "SSHD Protocol PROBLEM"
fi
#### LogLevel verbose
loglevelv=`sudo cat /etc/ssh/sshd_config  |grep -i "LogLevel verbose" |grep -v '#' |wc -l`
if [ $loglevelv == 1 ] ; then
echo "SSHD Loglevel OK"
else
echo "SSHD loglevel PROBLEM"
fi
#### StrictModes yes
strictmode=`sudo cat /etc/ssh/sshd_config  |grep -i "StrictModes yes" |grep -v '#' |wc -l`
if [ $strictmode == 1 ] ; then
echo "SSHD StrictMode OK"
else
echo "SSHD StrictMode PROBLEM"
fi
######
grubpwd=`sudo cat /etc/grub.conf |grep -i "password --md5" |wc -l`
if [ $grubpwd == 1 ] ; then
echo "GRUB password protected OK"
else
echo "GRUB password protected PROBLEM"
fi
#####
deny3auth=`sudo cat /etc/pam.d/system-auth |grep -i "deny=3 onerr=fail" | wc -l`
if [ $deny3auth == 1 ] ; then
echo "Three wrong password attempt auth OK"
else
echo "Three wrong password attempt auth PROBLEM"
fi
####
deny3acc=`sudo cat /etc/pam.d/system-auth |grep "deny=3 no_magic_root" |wc -l`
if [ $deny3acc == 1 ] ; then
echo "Three wrong password attempt account OK"
else
echo "Three wrong password attempt account PROBLEM"
fi
####
denypwd=`sudo cat /etc/pam.d/system-auth |grep "minlen=14 lcredit=-1" |wc -l`
if [ $denypwd == 1 ] ; then
echo "Three wrong password attempt password OK"
else
echo "Three wrong password attempt password PROBLEM"
fi
######
numopenfiles=`sudo cat /etc/security/limits.conf |grep "hard nofile" |wc -l`
if [ $numopenfiles == 1 ] ; then
echo "NUMBER of open files set OK"
else
echo "NUMBER of open files PROBLEM"
fi
#### UAL Configuration checking ############
ualconf=`cat /etc/bashrc |grep substitutions |wc -l`
if [ $ualconf == 1 ] ; then
echo "UAL Configuration OK"
else
echo "UAL Configuration PROBLEM"
fi
