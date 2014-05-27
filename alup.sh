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
#	set functions
# =======================
#	make_index is the function to create a basic index.html file
# 	within the documents directory of the new domain. The variable
# 	for domain name is passed into the file at $dname. You can alter
#	any of the code between the terms _EOF_ and it will be reflected
#	in the index.html file.

function make_index
{
cat <<- _EOF_
	<html>
	<head><title>$dname</title></head>
	<body>
	<h1>$dname</h1>
	<h2>setup success</h2>
	welcome to $dname
	</body> 

	</html>
_EOF_
} 

#	make_vhost is the function to create a config file that
#	Apache2 can interpret. The variable for the domain name is passed
#	into the file at $dname, and the system-wide variable for username
#	is passed into the file at $USER. You may wish to replace the
#	ServerAdmin email address with your own email address. You may alter
#	any of the code between the terms _EOF_ to build your own preferred 
#	standard config file.  

function make_vhost
{
cat <<- _EOF_
	<VirtualHost *:80>
	        ServerAdmin $USER@localhost
	        ServerName $dname
	        ServerAlias *.$dname

	        DirectoryIndex index.html index.htm index.php
	        DocumentRoot /var/www/$dname/public_html/

	        ScriptAlias /cgi-bin/ /var/www/$dname/cgi-bin/
	        <Location /cgi-bin>
	                Options +ExecCGI
	        </Location>

	        <Directory /var/www/$dname/>
	                Options Indexes FollowSymLinks MultiViews
	                AllowOverride All
	                Order allow,deny
	                Allow from all
	        </Directory>

	        ErrorLog /home/$USER/logs/$dname/error.log
	        CustomLog /home/$USER/logs/$dname/access.log combined
	</VirtualHost>
_EOF_
}

# =======================
#	     header
# =======================
clear  
echo "***      Site Setup      ***"
 
# =======================
# set domain name variable
# =======================
echo -n "==> Enter new domain name (domain.com): "
read dname
echo "Setting up files for $dname"

# =======================
# create needed directories
# =======================
mkdir -vp /var/www/$dname/public_html
mkdir -vp /var/www/$dname/public_html/cgi-bin
mkdir -vp /home/$USER/logs/$dname
touch /home/$USER/logs/$dname/access.log
echo "created /home/$USER/logs/$dname/access.log"
touch /home/$USER/logs/$dname/error.log
echo "created /home/$USER/logs/$dname/error.log"

# =======================
# build index.html file
# =======================
make_index > /var/www/$dname/public_html/index.html
echo "created /var/www/$dname/public_html/index.html"

# =======================
# build vhost config file
# =======================
make_vhost > /etc/apache2/sites-available/$dname.conf
echo "created /etc/apache2/sites-available/$dname.conf"

# =======================
# enable apache2 reload
# =======================

sudo a2ensite $dname

sudo service apache2 reload


# =======================
# enable apache2 reload
# =======================

sudo echo $'\n'"127.0.0.1  $dname www.$dname" >> /etc/hosts


# =======================
#    exit
# =======================

echo "***      Finished setting up files for $dname. Goodbye!"
exit