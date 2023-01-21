#!/bin/bash

service vsftpd start

useradd $ftpuser
echo -e "$ftppasswd\n$ftppasswd" | passwd $ftpuser
groupadd www-pub
usermod -aG www-pub $ftpuser
echo $ftpuser > /etc/vsftpd.userlist

mkdir -p /home/$ftpuser/ftp
chown -R $ftpuser:www-pub /home/$ftpuser/ftp
chmod 2775 /home/$ftpuser/ftp

echo "listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$ftpuser/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist" > /etc/vsftpd.conf

service vsftpd stop

vsftpd