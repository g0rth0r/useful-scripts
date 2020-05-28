# Nmap
Full credits: [https://scund00r.com/all/oscp/2018/02/25/passing-oscp.html](https://scund00r.com/all/oscp/2018/02/25/passing-oscp.html)
### Quick Scan

    nmap -sC -sV -vv -oA quick <TARGETIP>
### Quick UDP Scan
	nmap -sU -sV -vv -oA quick_udp <TARGETIP>
### Full TCP Scan
	nmap -sC -sV -p- -vv -oA full <TARGETIP>

### Port Knock
	for x in 7000 8000 9000; do nmap -Pn --host_timeout 201 --max-retries 0 -p $x <TARGETIP>; done

# Web Scanning
### Gobuster quick directory busting
	gobuster -u <TARGETIP> -w /usr/share/seclists/Discovery/Web_Content/common.txt -t 80 -a Linux

### Gobuster comprehensive directory busting
	gobuster -s 200,204,301,302,307,403 -u <TARGETIP> -w /usr/share/seclists/Discovery/Web_Content/big.txt -t 80 -a 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'

### Gobuster search with file extension
	gobuster -u <TARGETIP> -w /usr/share/seclists/Discovery/Web_Content/common.txt -t 80 -a Linux -x .txt,.php

### Nikto web server scan
	nikto -h <TARGETIP>

### Wordpress Scan
	wpscan -u <TARGETIP>/wp/

# Port Checking

### Netcat banner grab
	nc -v <TARGETIP> port
### Telnet banner grab
	telnet <TARGETIP> port
# SMB

### SMB Vulnerability Scan
	nmap -p 445 -vv --script=smb-vuln-cve2009-3103.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse <TARGETIP>

### SMB Users & Shares Scan
	nmap -p 445 -vv --script=smb-enum-shares.nse,smb-enum-users.nse <TARGETIP>
### Enum4linux
	enum4linux -a <TARGETIP>
### Null connect
	rpcclient -U "" <TARGETIP>
### Connect to SMB share
	smbclient //MOUNT/share
# SNMP

### SNMP enumeration
	snmp-check <TARGETIP>
