#! /bin/bash 
# 
# =======================
# Siteup Script 0.1
# Written by Command Line Idiot
# http://commandlineidiot.com
# You may use, modify, and redistribute this script freely
# Released: August 2007
# =======================


# =======================
#	     header
# =======================

echo "***      Site Removal      ***"
 
# =======================
# set domain name variable
# =======================
echo -n "==> Enter domain name to remove (domain.com): "
read dname

echo "Disabling Apache vHost"
# =======================
# enable apache2 reload
# =======================

sudo a2dissite $dname

echo "Reloading Apache"
sudo service apache2 reload


echo "Removing files for $dname"

# =======================
# remove directories
# =======================
rm -rf /var/www/$dname
echo "removed /var/www/$dname"
rm -rf /home/$USER/logs/$dname
echo "removed /home/$USER/logs/$dname"

# =======================
# remove vhost config file
# =======================
rm /etc/apache2/sites-available/$dname.conf
echo "removed /etc/apache2/sites-available/$dname.conf"


# =======================
#    exit
# =======================

echo "***      Finished removing $dname. Goodbye!"
exit