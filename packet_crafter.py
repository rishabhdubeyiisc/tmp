#! /usr/bin/env python2
from scapy.all import *
sport = 3377
dport = 2222
src = "192.168.40.2"
dst = "192.168.40.135"
ether = Ether(type=0x800, dst="00:0c:29:60:57:04", src="00:0c:29:78:b0:ff")
ip = IP(src=src, dst=dst)
SYN = TCP(sport=sport, dport=dport, flags='S', seq=1000)
xsyn = ether / ip / SYN / "Some Data"
packet = xsyn.build()
print(repr(packet))
