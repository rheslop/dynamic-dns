# dynamic-dns

This project was created primary for virtual test environments serving Red Hat or CentOS clients. The target system should have a hostname and network configuration complete for eth0.

- Sets up dynamic dns for an internal environment, routes traffic to external environment.
- Assumes eth0 is external, eth1 is internal.
- Edit variables in /vars/* to suit environment.

