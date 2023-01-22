@ECHO OFF
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
netsh advfirewall firewall delete rule all

netsh advfirewall firewall add rule name="Core Networking (HTTP-Out)" dir=out action=allow protocol=TCP remoteport=80
netsh advfirewall firewall add rule name="Core Networking (HTTPS-Out)" dir=out action=allow protocol=TCP remoteport=443
netsh advfirewall firewall add rule name="Core Networking (DNS-Out)" dir=out action=allow protocol=UDP remoteport=53 program="%%systemroot%%\system32\svchost.exe" service="dnscache"
netsh advfirewall firewall add rule name="Core Networking (DHCP-Out)" dir=out action=allow protocol=UDP localport=68 remoteport=67 program="%%systemroot%%\system32\svchost.exe" service="dhcp"

NETSH advfirewall reset
