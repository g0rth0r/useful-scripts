A collection of useful scripts

# Description

## shell
Bunch of shell scripts to be copied to /usr/local/bin/ with appropriate permissions.

- **myip**: return the IP
- **temps**: return the CPU and GPU temperatures

## netwotk
Bunch of networking, mainly iptables, related script

- **killswitch.up**: Kill switch script made to be run as a _up_ script in an __OpenVPN__ config file. Applies the VPN killswitch to a specific ___[USER]___.

   Also configured to allow BitTorrent traffic as well as allow connections within the ___[SUBNET]___ for WebUI of Transmission.


