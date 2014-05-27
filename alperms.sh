#! /bin/bash 
# 
# =======================
# Siteup Script 0.1
# Written by Command Line Idiot
# http://commandlineidiot.com
# You may use, modify, and redistribute this script freely
# Released: August 2007

sudo chown -R $USER:$USER /var/www
sudo chown -R $USER:$USER /etc/apache2/sites-available
sudo chown root:$USER /etc/hosts
sudo chmod 664 /etc/hosts
exit


