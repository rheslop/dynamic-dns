#!/bin/bash
#
rndc-confgen -a -r /dev/urandom

chown root:named /etc/rndc.key
chmod 0640 /etc/rndc.key

ALGORITHM=$(grep algorithm /etc/rndc.key | awk '{print $2}' | cut -d\; -f1)
SECRET=$(grep secret /etc/rndc.key | cut -d\" -f2)

sed -i 's|algorithm|'"algorithm ${ALGORITHM}"'|' /etc/dhcp/dhcpd.conf
sed -i 's|secret|'"secret ${SECRET}"'|' /etc/dhcp/dhcpd.conf
