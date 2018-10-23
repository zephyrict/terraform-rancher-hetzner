#!/bin/bash
declare -a arr=($1)

for PKGNAME in $1
do
  while [ `(dpkg-query -W -f='${Status}' $PKGNAME | grep -c "ok installed")` -eq 0 ]; do
    echo "*** Installing $PKGNAME ***"
    sudo apt-get install -y ufw unattended-upgrades $PKGNAME
    # Add sleep if retry
  done
  echo "*** $PKGNAME is installed ***"
done