#!/bin/bash
set -e
MAKE_THREADS=7

#update repo
apt-get update

##Build nginx on debian wheezy, ubuntu trusty
apt-get install -y build-essential rsync libpcre3-dev
NGINX_FILENAME="nginx-1.8.0"
TEMP_DIR="/tmp/aimpanel_setup"
mkdir -p $TEMP_DIR/nginx
mkdir -p /usr/local/aimpanel/libs/nginx/conf/
mkdir -p /usr/local/aimpanel/run/
wget http://nginx.org/download/$NGINX_FILENAME.tar.gz -O $TEMP_DIR/$NGINX_FILENAME.tar.gz
tar -xf $TEMP_DIR/$NGINX_FILENAME.tar.gz -C $TEMP_DIR/nginx
cd $TEMP_DIR/nginx/$NGINX_FILENAME
./configure --prefix=/usr/local/aimpanel/libs/nginx  \
 --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module \
 --user=aimpanel --group=aimpanel
make -j $MAKE_THREADS
make install

mkdir -p /vagrant/build/wheezy64/usr/local/aimpanel/libs/nginx/conf
rsync -rv --delete /usr/local/aimpanel/libs/nginx/ /vagrant/build/wheezy64/usr/local/aimpanel/libs/nginx/