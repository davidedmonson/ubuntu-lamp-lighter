ubuntu-lamp-lighter
===================

Ubuntu LAMP Developer Setup

A very simple set of scripts to create Apache (apach2) virtual hosts on a Ubuntu 14.04 LTS Desktop LAMP install. You may run these commands as a standard user. Within the script, there are commands that run as sudo.

Usage
1) Make sure all files are owned by your user and set to executable (chmod +x)
2) Run alperms.sh (./alperms.sh) to set the permissions
3) Run alup.sh to create a new local website including modifing your /etc/hosts file
4) Run aldown.sh to remove a local site. You must remove /etc/hosts entries manually