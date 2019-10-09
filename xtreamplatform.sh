#!/bin/bash

clear
jeshile='\e[40;38;5;82m' 
jo='\e[0m'  
red='\e[31m'
yellow='\e[0;93m'
echo " "
echo -e "${yellow} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${yellow} │        Xtream Codes Platform Installer       │ \e[0m"
echo -e "${yellow} └──────────────────────────────────────────────┘ \e[0m"
echo " " 
sleep 5
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │               Update System                  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────┘ \e[0m"
echo " " 
sudo apt update
sudo apt install -y lsb-core 
osname=$(lsb_release -si)
osrelease=$(lsb_release -sr)
oscodename=$(lsb_release -sc) 
osDisc=$(lsb_release -sd)
arch=$(uname -m)
file=/etc/rc.local
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │        Checking Xtream Codes Platform        │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────┘ \e[0m"
echo " " 
if [ "$osname" == "Ubuntu"  ]; then
if [ "$arch" == "x86_64"  ]; then
echo "" 
else
echo -e "${red} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${red} │[+]        The system is not supported        │ \e[0m"
echo -e "${red} └──────────────────────────────────────────────┘ \e[0m"
exit 3
fi
else
echo -e "${red} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${red} │[+]        The system is not supported        │ \e[0m"
echo -e "${red} └──────────────────────────────────────────────┘ \e[0m"
exit 3
fi
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │            Install phpmyadmin                │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────┘ \e[0m"
echo " " 
read -p "Please enter a password for your MySQL : " sqlpass
(mysql -uroot -p$sqlpass -e "CREATE DATABASE phpmyadmin"  2> /dev/null);
RESULT=`mysqlshow --user=root --password=$sqlpass mysql | grep -v Wildcard | grep -o mysql `
if [ "$RESULT" == "mysql" ]; then 
echo " "

echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │               Installing Package             │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────┘ \e[0m"
echo " " 
apt-get remove -y apache2
if [ "$osrelease" == "18.04" ] || [ "$osrelease" == "18.10" ]|| [ "$osrelease" == "19.04" ] ; then 
if ! grep -q "deb http://security.ubuntu.com/ubuntu xenial-security main" "$File"; then
echo 'deb http://security.ubuntu.com/ubuntu xenial-security main' >> /etc/apt/sources.list
fi
fi 
apt-get install -y lsb-release nscd curl 
sleep 1
apt-get install -y libxslt1-dev  
sleep 1
apt-get install -y libpq-dev 
sleep 1
apt-get install -y libmcrypt-dev 
sleep 1
apt-get install -y libltdl7 
sleep 1
apt-get install -y libssh2-1-dev 
sleep 1
apt-get install -y libgeoip-dev 
sleep 1
apt-get install -y libjpeg8 
sleep 1
apt-get install -y cron
sleep 1
apt-get install -y libcurl4-openssl-dev 
sleep 2
apt-get install -y libpq5 
sleep 1 
apt-get install -y dist-upgrade 
sleep 1 
apt-get install -y cron
sleep 1
apt-get install -y libpng12-0 
sleep 1
apt-get install -y libjpeg8 
sleep 1
apt-get install -y libcurl3 
sleep 1
apt-get install -y iftop 
sleep 1
apt-get install -y libgconf-2-4 
sleep 1
if [ "$osrelease" == "18.04" ] || [ "$osrelease" == "18.10" ] ; then 
wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb && dpkg -i /tmp/libpng12.deb   && rm /tmp/libpng12.deb
fi
if [ "$osrelease" == "19.04" ] ; then 
apt install -y alien elfutils 
sudo apt-get remove -y libcurl4
wget http://download-ib01.fedoraproject.org/pub/fedora/linux/releases/29/Everything/x86_64/os/Packages/l/libpng12-1.2.57-8.fc29.x86_64.rpm -P /root 
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb -P /root 
wget http://archive.ubuntu.com/ubuntu/pool/universe/c/curl3/libcurl3_7.58.0-2ubuntu2_amd64.deb -P /root 
cd /root/
sudo alien -cv *.rpm 
sudo dpkg -i *.deb 
sudo ln -s /usr/lib64/libpng12.so.0 /usr/lib/x86_64-linux-gnu/libpng12.so.0 
fi
echo -e "${jeshile} ┌────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  install Iptables Persistent And Open VPN  │ \e[0m"
echo -e "${jeshile} └────────────────────────────────────────────┘ \e[0m"
echo " "
sudo apt-get install iptables-persistent && apt-get install openvpn -y
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │        Install Xtream Codes Platform         │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────┘ \e[0m"
echo " " 
sleep 1
/usr/sbin/userdel -f xtreamcodes  
sleep 1
/usr/sbin/useradd -s /sbin/nologin -U -d /home/xtreamcodes -m xtreamcodes
sleep 1
wget http://192.168.1.81/iptv_xtream_codes.tar.gz -P /home/xtreamcodes/ 
sleep 1
tar -zxvf /home/xtreamcodes/iptv_xtream_codes.tar.gz -C /home/xtreamcodes/  
sleep 1
rm -r  /home/xtreamcodes/iptv_xtream_codes.tar.gz
sleep 1
mv /home/xtreamcodes/iptv_xtream_codes/xtreamcodes  /etc/init.d/ 
sleep 1
chmod 755  /etc/init.d/xtreamcodes
sleep 1
update-rc.d xtreamcodes defaults 
sleep 1
mysql -uroot -p$sqlpass phpmyadmin < /home/xtreamcodes/iptv_xtream_codes/phpmyadmin.sql > /dev/null 2>&1
sleep 1
rm -r  /home/xtreamcodes/iptv_xtream_codes/phpmyadmin.sql
sleep 1
chmod 755 /home/xtreamcodes/iptv_xtream_codes/phpmyadmin/config.inc.php 
if [ -f "$file" ]
then
sed --in-place '/exit 0/d' /etc/rc.local 
echo "sleep 1" >> /etc/rc.local
echo "sudo /etc/init.d/xtreamcodes start" >> /etc/rc.local
echo -e " \n " >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
else 
echo "#!/bin/sh -e" >> /etc/rc.local
echo "#">> /etc/rc.local
echo "# rc.local">> /etc/rc.local
echo "#">> /etc/rc.local
echo "# This script is executed at the end of each multiuser runlevel." >> /etc/rc.local
echo "# value on error." >> /etc/rc.local
echo "#" >> /etc/rc.local
echo "# In order to enable or disable this script just change the execution" >> /etc/rc.local
echo "# bits." >> /etc/rc.local
echo "#" >> /etc/rc.local
echo "# By default this script does nothing." >> /etc/rc.local
echo -e " \n " >> /etc/rc.local
echo "sleep 1" >> /etc/rc.local
echo "sudo /etc/init.d/xtreamcodes start" >> /etc/rc.local
echo -e " \n " >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
sleep 1
chmod +x /etc/rc.local  
fi

else
echo -e "${red} ┌──────────────────────────────────────────────┐ \e[0m"
echo -e "${red} │          mysql Password is incorrect         │ \e[0m"
echo -e "${red} └──────────────────────────────────────────────┘ \e[0m"
sleep 5
./XtreamPlatform.sh
fi
