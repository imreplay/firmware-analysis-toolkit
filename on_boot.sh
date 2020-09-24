#! /bin/bash

python3 /fat/reset.py

echo "hello test"


iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to 192.168.0.1:80
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 443 -j DNAT --to 192.168.0.1:443

file="/fat/ip/ipset.sh"
if [ -e $file ]; then
chmod a+x /fat/ip/ipset.sh
/fat/ip/ipset.sh
fi

python3 /fat/fat.py /fat/firmwares/*
