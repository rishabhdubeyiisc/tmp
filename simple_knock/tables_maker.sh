#! /bin/bash
#flushing all rules
iptables -F
#allowing the existing ssh
iptables -I INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
#making machine ping-albe
iptables -I INPUT -p icmp -j ACCEPT

#setting up new chain 
iptables -N KNOCKING
#defining knock scenario 
iptables -A INPUT -p tcp -m tcp --dport 1000 -m recent --set --name KNOCKING –rsource

iptables -A INPUT -p tcp -m tcp --dport 22 -m recent --rcheck --seconds 15 --name KNOCKING --rsource -j ACCEPT

iptables –A INPUT –j REJECT

iptables -P INPUT DROP

service iptables save

service iptables start 

#printing after execution
iptables -nL