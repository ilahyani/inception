#!/bin/bash

useradd $ftpuser

echo -e "$ftppasswd\n$ftppasswd" | passwd $ftpuser

echo $ftpuser > /etc/vsftpd.user_list

mkdir -p /home/$ftpuser/empty

chown -R $ftpuser:$ftpuser /home/$ftpuser

chmod 755 /home/$ftpuser/empty

echo "listen=YES
listen_ipv6=NO
anonymous_enable=YES
local_enable=YES
write_enable=YES
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/home/$ftpuser
allow_writeable_chroot=YES
pam_service_name=vsftpd
user_sub_token=$ftpuser
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=41000
userlist_enable=YES
userlist_file=/etc/vsftpd.user_list
userlist_deny=NO
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO" > /etc/vsftpd.conf

service vsftpd start

tail -f