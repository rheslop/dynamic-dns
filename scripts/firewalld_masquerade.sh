#!/bin/bash

firewall-cmd --add-interface eth0 --zone=external
echo "ZONE=external" >> /etc/sysconfig/network-scripts/ifcfg-eth0

firewall-cmd --add-interface eth1 --zone=internal
echo "ZONE=internal" >> /etc/sysconfig/network-scripts/ifcfg-eth1

