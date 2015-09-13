#!/bin/bash
[ -z "$1" ] && echo "Provide version number like 1.0" >&2 && exit 1
set -e

#
# wheezy64
#
mkdir -p build/wheezy64/etc/init.d/
rsync -rv wheezy64/ build/wheezy64/

cd build/wheezy64

fpm -s dir -t deb \
 --version $1 \
 --name "aimpanel-nginx" \
 --description "Easy to use control panel for game servers - integrated high performance nginx WWW server" \
 --url "https://lvlup.pro" \
 --vendor "LVL UP" \
 -m "Michał Frąckiewicz <michal@lvlup.pro>" \
 --license "All rights reserved" \
 --before-install beforeinstall \
 --after-install afterinstall \
 -d aimpanel-php \
 usr etc

#sign that package
dpkg-sig --sign builder *.deb
cd -

#
# jessie64
#