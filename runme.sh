#!/bin/bash

####################################################
#
# The DNS forwarder (192.168.124.1) is the expected
# IP address of KVM's default network. This can be 
# changed here if needed.
FORWARDER=192.168.124.1
####################################################

# Assign variables

echo "Subnet will be 192.168.x.0/24"
echo ""
read -p "x = " OCTET3
echo ""
echo "Enter a domain; for example,  example.com"
read -p "Domain: " DOMAIN

DOMAIN_NAME=$(echo $DOMAIN | awk -F. '{print $1}')
TOP_LEVEL=$(echo $DOMAIN | awk -F. '{print $2}')

############  Populate Files #####################

cat > vars/dhcp-vars.yml << EOF
---
# DHCP
subnet: 192.168.${OCTET3}.0
netmask: 255.255.255.0
range_start: 192.168.${OCTET3}.128
range_end: 192.168.${OCTET3}.254
router: 192.168.${OCTET3}.2
domain_name_servers: 192.168.${OCTET3}.2
domain_search: ${DOMAIN}
time_offset: -21600
default_lease_time: 600
max_lease_time: 7200
EOF

cat > vars/dns-vars.yml << EOF
#DNS
public_interface: eth0
listen_on: 192.168.${OCTET3}.2
last_octet: 2
allow_query: 192.168.${OCTET3}.0/24
forwarder_1: $FORWARDER
domain: ${DOMAIN_NAME}
top_level_domain: ${TOP_LEVEL}
reverse: ${OCTET3}.168.192.in-addr.arpa
EOF

##################################################

# Run ansible playbook

ansible-playbook -i hosts ddns.yml

