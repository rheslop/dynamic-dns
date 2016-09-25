# dynamic-dns

This project assists in the creation of a lab environment. More specifically, it will modify a virtual machine to:

	- Offer dynamic dns for an internal environemnt.
	- Route traffic from internal to external network.

This will allow additional VMs to be immediately named, addresseable, with full internet access.

The required target host should have:

	- Two interfaces, public and private.
	- Public interface should be on a NATing network.
	- If NATing network IP is not 192.168.124.1,
	  then the runme.sh script must be updated for accuracy.
	- eth0 facing public interface, eth1 facing private network.
	- Name or IP of target host entered in ansible hosts file.
	  For example:

	router-net1 ansible_host=192.168.124.78

Start by running script 'runme.sh'  You will be asked to provide the following:

	- Subnet to be used: If 192.168.x.0/24, what is x?
	- Domain, for example, example.com
	- Target host: See above for including host in ansible hosts file.
