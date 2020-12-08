#! /bin/bash

ports=“1111 2222 3333”
host=“<span class="highlight”>your_server</span>“

for x in $ports
do
nmap -Pn –host_timeout 201 –max-retries 0 -p $x $host sleep 1 done ssh <span class="highlight”>user</span>@${host} </pre>
